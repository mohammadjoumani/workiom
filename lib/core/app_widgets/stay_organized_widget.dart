import 'package:flutter/material.dart';
import 'package:workiom/core/app_widgets/app_svg_picture_widget.dart';
import 'package:workiom/core/extension/widget_extension.dart';
import 'package:workiom/core/resource/assets_manager.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/font_manager.dart';
import 'package:workiom/core/resource/style_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';

class StayOrganizedWidget extends StatelessWidget {
  const StayOrganizedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: AppPadding.p32,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'Stay organized with',
                style: StyleManager.getRegularStyle(
                  color: ColorManager.colorBlack2,
                  fontSize: FontSize.s16,
                ),
              ).marginOnly(
                end: AppPadding.p4,
              ),
            ),
            const AppSvgPictureWidget(
              assetName: AssetsManager.imgHorizontalLogo,
            ),
          ],
        ),
      ),
    );
  }
}
