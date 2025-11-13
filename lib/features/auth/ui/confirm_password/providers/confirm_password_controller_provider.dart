import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workiom/features/auth/ui/confirm_password/controller/confirm_password_controller.dart';
import 'package:workiom/features/auth/ui/confirm_password/controller/confirm_password_state.dart';

final confirmPasswordControllerProvider = NotifierProvider.autoDispose<ConfirmPasswordController, ConfirmPasswordState>(
  () {
    return ConfirmPasswordController();
  },
);
