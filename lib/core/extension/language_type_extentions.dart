import 'package:workiom/core/resource/language_manager.dart';

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
  //
  // String getValueHeaderBackend() {
  //   switch (this) {
  //     case LanguageType.english:
  //       return englishHeaderBackend;
  //     case LanguageType.arabic:
  //       return arabicHeaderBackend;
  //   }
  // }
}
