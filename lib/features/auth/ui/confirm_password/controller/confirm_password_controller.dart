import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workiom/core/extension/validation_extension.dart';
import 'package:workiom/core/util/data_state.dart';
import 'package:workiom/features/auth/models/password_complexity_model.dart';
import 'package:workiom/features/auth/models/validation_password_model.dart';
import 'package:workiom/features/auth/providers/auth_repository_provider.dart';

import 'confirm_password_state.dart';

class ConfirmPasswordController extends Notifier<ConfirmPasswordState> {
  @override
  ConfirmPasswordState build() {
    state = _onInit();
    getPasswordComplexitySetting();
    return state;
  }

  ConfirmPasswordState _onInit() => ConfirmPasswordState();

  void getPasswordComplexitySetting() async {
    final repository = ref.read(authRepositoryProvider);
    state = state.copyWith(
      getPasswordComplexitySettingDataState: DataState.loading,
    );
    final result = await repository.getPasswordComplexitySetting();
    result.fold(
      (l) => state = state.copyWith(
        getPasswordComplexitySettingDataState: DataState.failure,
        failure: l,
      ),
      (r) {
        final errors = getErrors(r, state.password);
        state = state.copyWith(
          getPasswordComplexitySettingDataState: DataState.success,
          setting: r,
          errors: errors,
          isValidPassword: false,
        );
      },
    );
  }

  void changeEmail(String email) {
    state = state.copyWith(
      email: email,
      emailValidationMessage: email.validateEmail,
    );
  }

  void changePassword(String password) {
    final errors = getErrors(state.setting, password);
    state = state.copyWith(
      password: password,
      errors: errors,
      isValidPassword: errors.every((error) => error.isValid),
    );
  }

  void changeVisibilityPassword() {
    state = state.copyWith(
      obscureText: !state.obscureText,
    );
  }

  List<ValidationPasswordModel> getErrors(PasswordComplexityModel? setting, String password) {
    return [
      ValidationPasswordModel(
        isValid: password.length >= (setting?.requiredLength ?? 0),
        value: 'Password must have at least ${setting?.requiredLength} characters.',
      ),
      if (setting?.requireDigit == true) ...{
        ValidationPasswordModel(
          isValid: !(setting?.requireDigit ?? false) || RegExp(r'\d').hasMatch(password),
          value: 'Password must contain at least one digit (0–9).',
        ),
      },
      if (setting?.requireLowercase == true) ...{
        ValidationPasswordModel(
          isValid: !(setting?.requireLowercase ?? false) || RegExp(r'[a-z]').hasMatch(password),
          value: 'Password must contain at least one lowercase letter (a–z).',
        ),
      },
      if (setting?.requireUppercase == true) ...{
        ValidationPasswordModel(
          isValid: !(setting?.requireUppercase ?? false) || RegExp(r'[A-Z]').hasMatch(password),
          value: 'Password must contain at least one uppercase letter (A–Z).',
        ),
      },
      if (setting?.requireNonAlphanumeric == true) ...{
        ValidationPasswordModel(
          isValid: !(setting?.requireNonAlphanumeric ?? false) || RegExp(r'[^a-zA-Z0-9]').hasMatch(password),
          value: 'Password must contain at least one special character.',
        ),
      }
    ];
  }
}
