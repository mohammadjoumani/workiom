import 'package:workiom/core/resource/language_manager.dart';
import 'package:workiom/core/resource/string_manager.dart';
import 'package:workiom/core/util/app_context.dart';

extension ValidationExtension on String {
  String get validateEmail {
    final context = AppContext.context;
    if (isEmpty) {
      return AppStrings.strEmailEmpty.tr(context);
    }
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this)) {
      return AppStrings.strEmailNotValid.tr(context);
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

  String get validateTenantName {
    // final context = AppContext.context;
    if (isEmpty) {
      return 'The tenant name cannot be empty.';
    }
    if (!RegExp(r'^[a-z][a-z0-9-]*$').hasMatch(this)) {
      return 'Tenant name must start with a letter';
    }

    return '';
  }

  String get validateFirstName {
    // final context = AppContext.context;
    if (isEmpty) {
      return 'The tenant name cannot be empty.';
    }
    if (!RegExp(r'^[a-z]+$').hasMatch(this)) {
      return 'First name must contain only letters.';
    }

    return '';
  }

  String get validateLastName {
    // final context = AppContext.context;
    if (isEmpty) {
      return 'The tenant name cannot be empty.';
    }
    if (!RegExp(r'^[a-z]+$').hasMatch(this)) {
      return 'Last name must contain only letters.';
    }

    return '';
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
