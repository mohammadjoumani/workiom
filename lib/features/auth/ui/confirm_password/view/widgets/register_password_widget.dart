import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workiom/core/app_widgets/app_ripple_widget.dart';
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
import 'package:workiom/features/auth/ui/confirm_password/hooks/register_password_hook.dart';
import 'package:workiom/features/auth/ui/confirm_password/providers/confirm_password_controller_provider.dart';

import 'password_validation_errors_widget.dart';

class RegisterPasswordWidget extends HookConsumerWidget {
  const RegisterPasswordWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      confirmPasswordControllerProvider.select(
        (value) => value.getPasswordComplexitySettingDataState,
      ),
    );

    final controller = useRegisterPasswordController(
      ref: ref,
      initialText: '',
    );

    final obscureText = ref.watch(
      confirmPasswordControllerProvider.select(
        (value) => value.obscureText,
      ),
    );

    return IgnorePointer(
      ignoring: state != DataState.success,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.strYourPassword.tr(context),
            style: StyleManager.getRegularStyle(
              color: ColorManager.colorBlack1,
              fontSize: FontSize.s16,
            ),
          ).marginOnly(
            bottom: AppPadding.p8,
          ),
          AppTextFieldWidget(
            controller: controller,
            hintText: AppStrings.strEnterYourPassword.tr(context),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            obscureText: obscureText,
            prefix: const AppSvgPictureWidget(
              assetName: AssetsManager.icPassword,
              width: AppSize.s24,
              height: AppSize.s24,
            ),
            suffixIcon: AppRippleWidget(
              radius: AppSize.s12,
              onTap: () {
                ref.read(confirmPasswordControllerProvider.notifier).changeVisibilityPassword();
              },
              child: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: obscureText ? ColorManager.colorGrey1 : ColorManager.colorPrimary,
              ),
            ),
            // errorText: errorText,
            helperText: ' ',
          ),
          if (state == DataState.success) ...{
            const PasswordValidationErrorsWidget(),
          }
        ],
      ),
    );
  }
}
