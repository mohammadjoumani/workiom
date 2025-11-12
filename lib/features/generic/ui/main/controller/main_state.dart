import 'dart:ui';

class MainState {
  Locale? locale;

  MainState({
    this.locale,
  });

  MainState copyWith({
    Locale? locale,
  }) {
    return MainState(
      locale: locale ?? this.locale,
    );
  }
}
