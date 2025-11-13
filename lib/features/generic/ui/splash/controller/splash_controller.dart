import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workiom/core/util/data_state.dart';
import 'package:workiom/features/generic/providers/generic_repository_provider.dart';

import 'splash_state.dart';

class SplashController extends Notifier<SplashState> {
  @override
  SplashState build() {
    state = _onInit();
    getCurrentLogin();
    return state;
  }

  SplashState _onInit() => SplashState();

  void getCurrentLogin() async {
    final repository = ref.read(genericRepositoryProvider);
    final result = await repository.getCurrentLogin();
    result.fold(
      (l) => state = state.copyWith(
        getCurrentLoginDataState: DataState.failure,
        failure: l,
      ),
      (r) => state = state.copyWith(
        getCurrentLoginDataState: DataState.success,
        currentLogin: r,
      ),
    );
  }
}
