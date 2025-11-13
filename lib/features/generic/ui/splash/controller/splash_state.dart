import 'package:workiom/core/network/failure.dart';
import 'package:workiom/core/util/data_state.dart';
import 'package:workiom/features/generic/models/current_login_model.dart';

class SplashState {
  final DataState getCurrentLoginDataState;
  final CurrentLoginModel? currentLogin;
  final Failure? failure;

  SplashState({
    this.getCurrentLoginDataState = DataState.initial,
    this.currentLogin,
    this.failure,
  });

  SplashState copyWith({
    DataState? getCurrentLoginDataState,
    CurrentLoginModel? currentLogin,
    Failure? failure,
  }) {
    return SplashState(
      getCurrentLoginDataState: getCurrentLoginDataState ?? this.getCurrentLoginDataState,
      currentLogin: currentLogin ?? this.currentLogin,
      failure: failure ?? this.failure,
    );
  }
}
