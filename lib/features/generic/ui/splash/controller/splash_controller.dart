import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'splash_state.dart';

class SplashController extends Notifier<SplashState> {
  @override
  SplashState build() {
    state = _onInit();
    return state;
  }

  SplashState _onInit() => SplashState();
}
