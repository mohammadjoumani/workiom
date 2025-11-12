import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_state.dart';

class MainController extends Notifier<MainState> {
  @override
  MainState build() {
    state = _onInit();
    initLocale();
    return state;
  }

  MainState _onInit() => MainState();

  void initLocale() {
    // final settingLocal = ref.read(settingLocalDataProvider);
    // final locale = settingLocal.getLocale();
    // state = state.copyWith(
    //   locale: locale,
    // );
  }

  void changeToEnglish() {
    // final settingLocal = ref.read(settingLocalDataProvider);
    // state = state.copyWith(
    //   locale: englishLocale,
    // );
    // settingLocal.setLanguageApp(LanguageType.english.getValue());
  }

  void changeToArabic() {
    // final settingLocal = ref.read(settingLocalDataProvider);
    // state = state.copyWith(
    //   locale: arabicLocale,
    // );
    // settingLocal.setLanguageApp(LanguageType.arabic.getValue());
  }
}
