import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workiom/features/generic/ui/splash/controller/splash_controller.dart';
import 'package:workiom/features/generic/ui/splash/controller/splash_state.dart';

final splashControllerProvider = NotifierProvider.autoDispose<SplashController, SplashState>(
  () {
    return SplashController();
  },
);
