import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/core/app_widgets/app_button_widget.dart';
import 'package:workiom/core/extension/widget_extension.dart';
import 'package:workiom/core/resource/language_manager.dart';
import 'package:workiom/core/resource/string_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';
import 'package:workiom/core/routes/app_routes.dart';
import 'package:workiom/features/auth/ui/confirm_password/providers/confirm_password_controller_provider.dart';

import 'register_email_widget.dart';
import 'register_password_widget.dart';

class FormRegisterSection extends StatelessWidget {
  const FormRegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RegisterEmailWidget().marginOnly(
          bottom: AppPadding.p4,
        ),
        const RegisterPasswordWidget().marginOnly(
          bottom: AppPadding.p32,
        ),
        Consumer(
          builder: (context, ref, child) {
            final isValidPassword = ref.watch(
              confirmPasswordControllerProvider.select(
                (value) => value.isValidPassword,
              ),
            );
            final isValidEmail = ref.watch(
              confirmPasswordControllerProvider.select(
                (value) => value.emailValidationMessage.isEmpty,
              ),
            );

            final email = ref.watch(
              confirmPasswordControllerProvider.select(
                (value) => value.email,
              ),
            );

            final password = ref.watch(
              confirmPasswordControllerProvider.select(
                (value) => value.password,
              ),
            );
            return AppButtonWidget.primary(
              label: AppStrings.strConfirmPassword.tr(context),
              onPressed: () => _onPressedConfirmPasswordButton(
                context: context,
                email: email,
                password: password,
              ),
              enabled: isValidPassword && isValidEmail,
              // isLoading: isLoading,
            );
          },
        ),
      ],
    );
  }

  _onPressedConfirmPasswordButton({
    required BuildContext context,
    required String email,
    required String password,
  }) {
    context.pushNamed(
      AppRoutes.completeInfoRoute,
      extra: {
        'email': email,
        'password': password,
      },
    );
  }
}
