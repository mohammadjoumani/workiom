import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:workiom/core/app_widgets/app_button_widget.dart';
import 'package:workiom/core/app_widgets/app_ripple_widget.dart';
import 'package:workiom/core/app_widgets/app_svg_picture_widget.dart';
import 'package:workiom/core/extension/widget_extension.dart';
import 'package:workiom/core/resource/assets_manager.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/font_manager.dart';
import 'package:workiom/core/resource/language_manager.dart';
import 'package:workiom/core/resource/string_manager.dart';
import 'package:workiom/core/resource/style_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';
import 'package:workiom/core/routes/app_routes.dart';
import 'package:workiom/core/util/constants.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.strCreateAccount.tr(context),
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
            AppButtonWidget.secondary(
              label: AppStrings.strContinueGoogle.tr(context),
              onPressed: () => _onPressedContinueWithGoogleButton(context),
              assetsIcon: AssetsManager.icGoogle,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.strOr.tr(context),
                style: StyleManager.getRegularStyle(
                  color: ColorManager.colorBlack2,
                  fontSize: FontSize.s12,
                ),
              ),
            ).marginSymmetric(
              vertical: AppPadding.p40,
            ),
            AppButtonWidget.primary(
              label: AppStrings.strContinueEmail.tr(context),
              onPressed: () => _onPressedContinueWithEmailButton(context),
            ).marginOnly(
              bottom: AppPadding.p16,
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: 'By signing up, you agree ',
                style: StyleManager.getRegularStyle(
                  color: ColorManager.colorBlack2,
                ),
                children: [
                  WidgetSpan(
                    child: AppRippleWidget(
                      onTap: () => _onPressedTermsAndConditions(context),
                      child: Text(
                        'Terms Of Service',
                        style: StyleManager.getRegularStyle(
                          color: ColorManager.colorBlack2,
                        ).copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: ' And ',
                    style: StyleManager.getRegularStyle(
                      color: ColorManager.colorBlack2,
                    ),
                  ),
                  WidgetSpan(
                    child: AppRippleWidget(
                      onTap: () => _onPressedPrivacyPolicy(context),
                      child: Text(
                        'Privacy Policy',
                        style: StyleManager.getRegularStyle(
                          color: ColorManager.colorBlack2,
                        ).copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  // TextSpan(
                  //   text: 'Privacy Policy',
                  //   style: StyleManager.getRegularStyle(
                  //     color: ColorManager.colorBlack2,
                  //   ).copyWith(
                  //     decoration: TextDecoration.underline,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onPressedContinueWithGoogleButton(BuildContext context) {
    // context.pushNamed(AppRoutes.loginRoute);
  }

  _onPressedContinueWithEmailButton(BuildContext context) {
    context.pushNamed(AppRoutes.signUpRoute);
  }

  _onPressedPrivacyPolicy(BuildContext context) {
    launchUrlString(
      Constants.termsConditions,
      mode: LaunchMode.inAppBrowserView,
    );
  }

  _onPressedTermsAndConditions(BuildContext context) {
    launchUrlString(
      Constants.termsConditions,
      mode: LaunchMode.inAppBrowserView,
    );
  }
}
