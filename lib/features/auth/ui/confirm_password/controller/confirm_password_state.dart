import 'package:workiom/core/network/failure.dart';
import 'package:workiom/core/util/data_state.dart';
import 'package:workiom/features/auth/models/password_complexity_model.dart';
import 'package:workiom/features/auth/models/user_model.dart';
import 'package:workiom/features/auth/models/validation_password_model.dart';

class ConfirmPasswordState {
  final DataState submitRegisterDataState;
  final DataState getPasswordComplexitySettingDataState;
  final PasswordComplexityModel? setting;
  final String email;
  final String emailValidationMessage;
  final String password;
  final String passwordValidationMessage;
  final List<ValidationPasswordModel> errors;
  final bool isValidPassword;
  final UserModel? user;
  final bool obscureText;
  final Failure? failure;

  ConfirmPasswordState({
    this.submitRegisterDataState = DataState.initial,
    this.getPasswordComplexitySettingDataState = DataState.initial,
    this.setting,
    this.email = '',
    this.emailValidationMessage = '',
    this.password = '',
    this.passwordValidationMessage = '',
    this.errors = const [],
    this.isValidPassword = false,
    this.obscureText = true,
    this.user,
    this.failure,
  });

  ConfirmPasswordState copyWith({
    DataState? submitRegisterDataState,
    DataState? getPasswordComplexitySettingDataState,
    PasswordComplexityModel? setting,
    String? email,
    String? emailValidationMessage,
    String? password,
    String? passwordValidationMessage,
    List<ValidationPasswordModel>? errors,
    bool? isValidPassword,
    bool? obscureText,
    UserModel? user,
    Failure? failure,
  }) {
    return ConfirmPasswordState(
      submitRegisterDataState: submitRegisterDataState ?? this.submitRegisterDataState,
      getPasswordComplexitySettingDataState: getPasswordComplexitySettingDataState ?? this.getPasswordComplexitySettingDataState,
      setting: setting ?? this.setting,
      email: email ?? this.email,
      emailValidationMessage: emailValidationMessage ?? this.emailValidationMessage,
      password: password ?? this.password,
      passwordValidationMessage: passwordValidationMessage ?? this.passwordValidationMessage,
      errors: errors ?? this.errors,
      isValidPassword: isValidPassword ?? this.isValidPassword,
      obscureText: obscureText ?? this.obscureText,
      user: user ?? this.user,
      failure: failure ?? this.failure,
    );
  }
}
