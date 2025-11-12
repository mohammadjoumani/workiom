import 'package:workiom/core/resource/language_manager.dart';
import 'package:workiom/core/resource/string_manager.dart';
import 'package:workiom/core/util/app_context.dart';

extension ValidationExtension on String {
  String get validatePassword {
    final context = AppContext.context;
    if (isEmpty) {
      return 'AppStrings.strPasswordEmpty.tr(context)';
    }
    if (length < 8) {
      return 'AppStrings.strPasswordMinLength.tr(context)';
    }
    // List<String> errors = [];
    //
    // if (!RegExp(r'[A-Z]').hasMatch(this)) {
    //   errors.add(AppStrings.strUppercaseLetter.tr(context));
    // }
    // if (!RegExp(r'[a-z]').hasMatch(this)) {
    //   errors.add(AppStrings.strLowercaseLetter.tr(context));
    // }
    // if (!RegExp(r'[0-9]').hasMatch(this)) {
    //   errors.add(AppStrings.strNumber.tr(context));
    // }
    // if (!RegExp(r'[!@#\$&*~%^()\-_=+{};:,<.>]').hasMatch(this)) {
    //   errors.add(AppStrings.strSpecialCharacter.tr(context));
    // }
    //
    // if (errors.isNotEmpty) {
    //   return '${AppStrings.strPasswordComplexity.tr(context)} ${errors.join(', ')}.';
    // }
    return '';
  }

  String get validateUserName {
    final context = AppContext.context;
    if (isEmpty) {
      return 'AppStrings.strUserNameEmpty.tr(context)';
    }
    return '';
  }

  String get validateRequiredField {
    final context = AppContext.context;
    if (isEmpty) {
      return AppStrings.strFieldRequired.tr(context);
    }
    return '';
  }

  bool isValidSaudiPhone() {
    final regex = RegExp(r'^05[0-9]{8}$');
    return regex.hasMatch(this);
  }

  bool isValidEmail() {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool isValidPassword() {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~%^()\-_=+{};:,<.>]).{8,}$');
    return contains(regex);
  }

  bool isValidIban() {
    return RegExp(r'^EG\d{27}$').hasMatch(this);
  }
}

extension ValidationExtension1 on String? {
  bool isValidPhoneNumber() {
    if (this == null) {
      return false;
    } else {
      final validatedPhoneNumber = this!.isNotEmpty && this!.length >= 11;
      return validatedPhoneNumber;
    }
  }
}

extension ValidationObjectExtension on Object? {
  String get validateRequiredField {
    final context = AppContext.context;
    if (this == null) {
      return AppStrings.strFieldRequired.tr(context);
    }
    return '';
  }
}

extension ValidationListExtension on List<Object> {
  String get validateRequiredField {
    final context = AppContext.context;
    if (isEmpty) {
      return AppStrings.strFieldRequired.tr(context);
    }
    return '';
  }
}

extension ValidationIntegerExtension on int {
  String get validateRequiredField {
    final context = AppContext.context;
    if (this < 0) {
      return AppStrings.strFieldRequired.tr(context);
    }
    return '';
  }

  String get validateRequiredField1 {
    final context = AppContext.context;
    if (this <= 0) {
      return AppStrings.strFieldRequired.tr(context);
    }
    return '';
  }
}

extension ValidationNumExtension on num {
  String get validateRequiredField {
    final context = AppContext.context;
    if (this < 0) {
      return AppStrings.strFieldRequired.tr(context);
    }
    return '';
  }

  String get validateRequiredField1 {
    final context = AppContext.context;
    if (this <= 0) {
      return AppStrings.strFieldRequired.tr(context);
    }
    return '';
  }
}
