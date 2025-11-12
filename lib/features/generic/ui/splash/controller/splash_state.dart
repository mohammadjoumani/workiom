import 'package:workiom/core/network/failure.dart';
import 'package:workiom/core/util/data_state.dart';

class SplashState {
  final DataState getBaseConfigDataState;
  final Failure? failure;

  SplashState({
    this.getBaseConfigDataState = DataState.initial,
    this.failure,
  });

  SplashState copyWith({
    DataState? getBaseConfigDataState,
    Failure? failure,
  }) {
    return SplashState(
      getBaseConfigDataState: getBaseConfigDataState ?? this.getBaseConfigDataState,
      failure: failure ?? this.failure,
    );
  }
}
