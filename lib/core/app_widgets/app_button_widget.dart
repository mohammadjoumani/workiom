import 'package:flutter/material.dart';
import 'package:workiom/core/extension/widget_extension.dart';
import 'package:workiom/core/resource/assets_manager.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/style_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';

import 'app_loading_widget.dart';
import 'app_svg_picture_widget.dart';

enum ButtonSize { small, large }

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget._(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.backgroundColor,
      required this.textColor,
      this.buttonSize = ButtonSize.large,
      this.assetsIcon,
      this.height,
      this.isLoading = false,
      this.enabled = true,
      this.showArrow = false});

  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final ButtonSize buttonSize;
  final String? assetsIcon;
  final double? height;
  final bool isLoading;
  final bool enabled;
  final bool showArrow;

  factory AppButtonWidget.primary({
    Key? key,
    required String label,
    required VoidCallback onPressed,
    double? height,
    bool isLoading = false,
    bool enabled = true,
    ButtonSize buttonSize = ButtonSize.large,
  }) {
    return AppButtonWidget._(
      key: key,
      label: label,
      onPressed: onPressed,
      backgroundColor: ColorManager.colorPrimary,
      textColor: ColorManager.colorWhite1,
      buttonSize: buttonSize,
      height: height,
      isLoading: isLoading,
      enabled: enabled,
      showArrow: true,
    );
  }

  factory AppButtonWidget.secondary({
    Key? key,
    required String label,
    required VoidCallback onPressed,
    String? assetsIcon,
    double? height,
    bool isLoading = false,
    bool enabled = true,
    ButtonSize buttonSize = ButtonSize.large,
  }) {
    return AppButtonWidget._(
      key: key,
      label: label,
      onPressed: onPressed,
      backgroundColor: ColorManager.colorWhite2,
      textColor: ColorManager.colorBlack1,
      buttonSize: buttonSize,
      assetsIcon: assetsIcon,
      height: height,
      isLoading: isLoading,
      enabled: enabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double mHeight = height ?? (buttonSize == ButtonSize.large ? AppSize.s50 : AppSize.s40);
    return SizedBox(
      height: mHeight,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading || !enabled ? null : onPressed,
          borderRadius: BorderRadius.circular(AppSize.s16),
          child: Ink(
            decoration: BoxDecoration(
              color: enabled ? backgroundColor : ColorManager.colorDisable,
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
            child: isLoading
                ? AppLoadingWidget(
                    color: textColor,
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (assetsIcon != null) ...{
                            AppSvgPictureWidget(
                              assetName: assetsIcon!,
                              width: AppSize.s24,
                              height: AppSize.s24,
                            ).marginOnly(
                              end: AppPadding.p4,
                            ),
                          },
                          Flexible(
                            child: Text(
                              label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: StyleManager.getSemiBoldStyle(
                                color: textColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      if (showArrow) ...{
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Container(
                            width: AppSize.s28,
                            height: AppSize.s20,
                            margin: const EdgeInsetsDirectional.only(
                              end: AppPadding.p16,
                            ),
                            padding: const EdgeInsets.all(AppPadding.p4),
                            decoration: BoxDecoration(
                              color: ColorManager.colorWhite1.withAlpha(50),
                              borderRadius: BorderRadius.circular(
                                AppSize.s4,
                              ),
                            ),
                            child: const AppSvgPictureWidget(
                              assetName: AssetsManager.icArrow,
                              height: AppSize.s20,
                              width: AppSize.s20,
                            ),
                          ),
                        ),
                      }
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
