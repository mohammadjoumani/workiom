import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workiom/core/app_widgets/app_svg_picture_widget.dart';
import 'package:workiom/core/extension/widget_extension.dart';
import 'package:workiom/core/resource/assets_manager.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/font_manager.dart';
import 'package:workiom/core/resource/language_manager.dart';
import 'package:workiom/core/resource/string_manager.dart';
import 'package:workiom/core/resource/style_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';
import 'package:workiom/features/auth/models/validation_password_model.dart';
import 'package:workiom/features/auth/ui/confirm_password/providers/confirm_password_controller_provider.dart';

class PasswordValidationErrorsWidget extends ConsumerWidget {
  const PasswordValidationErrorsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errors = ref.watch(
      confirmPasswordControllerProvider.select(
        (value) => value.errors,
      ),
    );

    final password = ref.watch(
      confirmPasswordControllerProvider.select(
        (value) => value.password,
      ),
    );

    final isValidPassword = ref.watch(
      confirmPasswordControllerProvider.select(
        (value) => value.isValidPassword,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: getValue(errors, password),
          backgroundColor: ColorManager.colorWhite2,
          color: isValidPassword ? ColorManager.colorGreen : ColorManager.colorOrange,
          minHeight: 10,
          borderRadius: BorderRadius.circular(AppSize.s4),
        ).marginOnly(
          bottom: AppPadding.p8,
        ),
        Row(
          children: [
            AppSvgPictureWidget(
              assetName: isValidPassword ? AssetsManager.icCheckTrue : AssetsManager.icInfo,
            ).marginOnly(
              end: AppPadding.p4,
            ),
            Expanded(
              child: Text(
                AppStrings.strNotEnoughStrong.tr(context),
                style: StyleManager.getMediumStyle(
                  color: ColorManager.colorBlack1,
                  fontSize: FontSize.s16,
                ),
              ),
            ),
          ],
        ),
        for (final error in errors)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSvgPictureWidget(
                assetName: error.isValid ? AssetsManager.icCheckTrue : AssetsManager.icCheckFalse,
              ).marginOnly(
                end: AppPadding.p4,
              ),
              Expanded(
                child: Text(
                  error.value,
                  style: StyleManager.getRegularStyle(
                    color: ColorManager.colorBlack2,
                    fontSize: FontSize.s12,
                  ),
                ),
              ),
            ],
          ).marginOnly(
            top: AppPadding.p8,
          ),
      ],
    );
  }

  double getValue(List<ValidationPasswordModel> errors, String value) {
    if (value.isEmpty || errors.isEmpty) return 0;

    final validCount = errors.where((e) => e.isValid).length;
    return validCount / errors.length;
  }
}
