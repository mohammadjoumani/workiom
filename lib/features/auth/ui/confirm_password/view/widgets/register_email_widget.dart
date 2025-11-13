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
import 'package:workiom/features/auth/ui/confirm_password/hooks/register_email_hook.dart';
import 'package:workiom/features/auth/ui/confirm_password/providers/confirm_password_controller_provider.dart';

class RegisterEmailWidget extends HookConsumerWidget {
  const RegisterEmailWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(
      confirmPasswordControllerProvider.select(
        (value) => value.emailValidationMessage,
      ),
    );

    final controller = useRegisterEmailController(
      ref: ref,
      initialText: '',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.strYourWorkEmail.tr(context),
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
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          prefix: const AppSvgPictureWidget(
            assetName: AssetsManager.icEmail,
            width: AppSize.s24,
            height: AppSize.s24,
          ),
          suffix: controller.text.isNotEmpty
              ? AppRippleWidget(
                  onTap: () {
                    controller.clear();
                  },
                  child: const AppSvgPictureWidget(
                    assetName: AssetsManager.icClear,
                  ),
                )
              : const SizedBox(),
          errorText: errorText,
          helperText: ' ',
        )
      ],
    );
  }
}
