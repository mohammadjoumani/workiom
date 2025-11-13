import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/core/app_widgets/app_button_widget.dart';
import 'package:workiom/core/extension/context_extension.dart';
import 'package:workiom/core/extension/widget_extension.dart';
import 'package:workiom/core/resource/language_manager.dart';
import 'package:workiom/core/resource/string_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';
import 'package:workiom/core/routes/app_args.dart';
import 'package:workiom/core/routes/app_routes.dart';
import 'package:workiom/core/util/data_state.dart';
import 'package:workiom/features/auth/ui/complete_info/controller/complete_info_state.dart';
import 'package:workiom/features/auth/ui/complete_info/providers/complete_info_controller_provider.dart';

import 'register_first_name_widget.dart';
import 'register_last_name_widget.dart';
import 'register_workspace_name_widget.dart';

class FormCompleteInfoSection extends StatelessWidget {
  const FormCompleteInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RegisterWorkSpaceNameWidget().marginOnly(
          bottom: AppPadding.p4,
        ),
        const RegisterFirstNameWidget().marginOnly(
          bottom: AppPadding.p4,
        ),
        const RegisterLastNameWidget().marginOnly(
          bottom: AppPadding.p32,
        ),
        Consumer(
          builder: (context, ref, child) {
            final workspaceName = ref.watch(
              completeInfoControllerProvider.select(
                (value) => value.workspaceName,
              ),
            );
            final firstName = ref.watch(
              completeInfoControllerProvider.select(
                (value) => value.firstName,
              ),
            );
            final lastName = ref.watch(
              completeInfoControllerProvider.select(
                (value) => value.lastName,
              ),
            );
            final workspaceValidationMessage = ref.watch(
              completeInfoControllerProvider.select(
                (value) => value.workspaceNameValidationMessage,
              ),
            );
            final firstNameValidationMessage = ref.watch(
              completeInfoControllerProvider.select(
                (value) => value.firstNameValidationMessage,
              ),
            );
            final lastNameValidationMessage = ref.watch(
              completeInfoControllerProvider.select(
                (value) => value.lastNameValidationMessage,
              ),
            );
            ref.listen(
              completeInfoControllerProvider,
              (previous, next) => submitRegisterListener(context, previous, next),
            );
            final isLoading = ref.watch(
              completeInfoControllerProvider.select(
                (value) => value.submitRegisterDataState == DataState.loading,
              ),
            );
            return AppButtonWidget.primary(
              label: AppStrings.strCreateWorkSpace.tr(context),
              onPressed: () => _onPressedRegisterWorkSpaceButton(ref),
              enabled: workspaceValidationMessage.isEmpty &&
                  firstNameValidationMessage.isEmpty &&
                  lastNameValidationMessage.isEmpty &&
                  workspaceName.isNotEmpty &&
                  firstName.isNotEmpty &&
                  lastName.isNotEmpty,
              isLoading: isLoading,
            );
          },
        ),
      ],
    );
  }

  _onPressedRegisterWorkSpaceButton(WidgetRef ref) {
    final email = appArgs['email'];
    final password = appArgs['password'];
    ref.read(completeInfoControllerProvider.notifier).register(
          email: email,
          password: password,
        );
  }

  void submitRegisterListener(BuildContext context, CompleteInfoState? previous, CompleteInfoState next) {
    if (previous?.submitRegisterDataState != next.submitRegisterDataState) {
      if (next.submitRegisterDataState == DataState.failure) {
        context.showMessage(
          message: next.failure?.message ?? '',
        );
      } else if (next.submitRegisterDataState == DataState.success) {
        context.pushReplacementNamed(AppRoutes.homeRoute);
      }
    }
  }
}
