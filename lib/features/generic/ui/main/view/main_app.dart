import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workiom/core/resource/font_manager.dart';
import 'package:workiom/core/resource/language_manager.dart';
import 'package:workiom/core/resource/theme_manager.dart';
import 'package:workiom/core/routes/router_manager.dart';
import 'package:workiom/core/util/constants.dart';
import 'package:workiom/features/generic/ui/main/providers/main_controller_provider.dart';

import 'widgets/main_app_body.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(
      mainControllerProvider.select(
        (value) => value.locale,
      ),
    );
    return MaterialApp.router(
      routerConfig: RouterManager.router,
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      builder: (context, child) => MainAppBody(
        child: child!,
      ),
      locale: locale,
      supportedLocales: const [
        englishLocale,
        arabicLocale,
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (deviceLocale != null && deviceLocale.languageCode == locale.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      theme: LightModeTheme().getThemeData(
        fontFamily: FontConstants.fontCairo,
      ),
    );
  }
}
