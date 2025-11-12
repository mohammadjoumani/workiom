import 'package:flutter/material.dart';
import 'package:workiom/core/app_widgets/app_ripple_widget.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/font_manager.dart';
import 'package:workiom/core/resource/language_manager.dart';
import 'package:workiom/core/resource/string_manager.dart';
import 'package:workiom/core/resource/style_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';

class OnboardingBackButtonWidget extends StatelessWidget {
  const OnboardingBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: AppPadding.p16,
      ),
      child: AppRippleWidget(
        onTap: () => _onPressedBackButton(context),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios,
            ),
            Text(
              AppStrings.strSignIn.tr(context),
              style: StyleManager.getRegularStyle(
                color: ColorManager.colorPrimary,
                fontSize: FontSize.s16,
              ),
            )
          ],
        ),
      ),
    );
  }

  _onPressedBackButton(BuildContext context) {}
}
