import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workiom/core/app_widgets/app_loading_widget.dart';
import 'package:workiom/core/app_widgets/app_svg_picture_widget.dart';
import 'package:workiom/core/app_widgets/app_text_field_widget.dart';
import 'package:workiom/core/extension/widget_extension.dart';
import 'package:workiom/core/resource/assets_manager.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/font_manager.dart';
import 'package:workiom/core/resource/language_manager.dart';
import 'package:workiom/core/resource/string_manager.dart';
import 'package:workiom/core/resource/style_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';
import 'package:workiom/core/util/data_state.dart';
import 'package:workiom/features/auth/ui/complete_info/hooks/register_workspace_hook.dart';
import 'package:workiom/features/auth/ui/complete_info/providers/complete_info_controller_provider.dart';

class RegisterWorkSpaceNameWidget extends HookConsumerWidget {
  const RegisterWorkSpaceNameWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      completeInfoControllerProvider.select(
        (value) => value.checkTenantAvailableDataState == DataState.loading,
      ),
    );

    final errorText = ref.watch(
      completeInfoControllerProvider.select(
        (value) => value.workspaceNameValidationMessage,
      ),
    );

    final controller = useRegisterWorkSpaceNameController(
      ref: ref,
      initialText: '',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.strWorkspaceName.tr(context),
          style: StyleManager.getRegularStyle(
            color: ColorManager.colorBlack1,
            fontSize: FontSize.s16,
          ),
        ).marginOnly(
          bottom: AppPadding.p8,
        ),
        AppTextFieldWidget(
          controller: controller,
          hintText: AppStrings.strEnterYourWorkEmail.tr(context),
          textInputAction: TextInputAction.next,
          prefix: isLoading
              ? const AppLoadingWidget(
                  color: ColorManager.colorPrimary,
                )
              : const AppSvgPictureWidget(
                  assetName: AssetsManager.icWorkSpace,
                  width: AppSize.s24,
                  height: AppSize.s24,
                ),
          suffixText: '.workiom.com',
          errorText: errorText,
          helperText: ' ',
        )
      ],
    );
  }
}
