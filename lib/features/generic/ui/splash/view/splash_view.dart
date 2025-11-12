import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workiom/core/app_widgets/app_scaffold_widget.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatefulHookConsumerWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() {
    //   final controller = ref.read(
    //     splashControllerProvider.notifier
    //   );
    //   controller.getBaseConfig();
    //   // controller.getRouter();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return const AppScaffoldWidget(
      body: SplashViewBody(),
    );
  }
}
