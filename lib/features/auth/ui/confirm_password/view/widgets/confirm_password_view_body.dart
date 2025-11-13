import 'package:flutter/material.dart';
import 'package:workiom/core/app_widgets/app_svg_picture_widget.dart';
import 'package:workiom/core/extension/widget_extension.dart';
import 'package:workiom/core/resource/assets_manager.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/font_manager.dart';
import 'package:workiom/core/resource/language_manager.dart';
import 'package:workiom/core/resource/string_manager.dart';
import 'package:workiom/core/resource/style_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';

import 'form_register_section.dart';

class ConfirmPasswordViewBody extends StatelessWidget {
  const ConfirmPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.strEnterStrongPassword.tr(context),
              style: StyleManager.getMediumStyle(
                color: ColorManager.colorBlack1,
                fontSize: FontSize.s22,
              ),
            ).marginOnly(
              bottom: AppPadding.p8,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    AppStrings.strStartJourney.tr(context),
                    style: StyleManager.getRegularStyle(
                      color: ColorManager.colorBlack2,
                      fontSize: FontSize.s16,
                    ),
                  ),
                ),
                const AppSvgPictureWidget(
                  assetName: AssetsManager.icEmojiHello,
                ).marginSymmetric(
                  horizontal: AppPadding.p4,
                ),
              ],
            ).marginOnly(
              bottom: AppPadding.p100,
            ),
            const FormRegisterSection()
          ],
        ),
      ),
    );
  }
}
