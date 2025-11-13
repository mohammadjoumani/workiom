import 'package:flutter/material.dart';
import 'package:workiom/core/app_widgets/app_svg_picture_widget.dart';
import 'package:workiom/core/extension/widget_extension.dart';
import 'package:workiom/core/resource/assets_manager.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/font_manager.dart';
import 'package:workiom/core/resource/style_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Thank you for choosing',
            style: StyleManager.getMediumStyle(
              color: ColorManager.colorBlack1,
              fontSize: FontSize.s22,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  'Workiom',
                  style: StyleManager.getMediumStyle(
                    color: ColorManager.colorBlack1,
                    fontSize: FontSize.s22,
                  ),
                ),
              ),
              const AppSvgPictureWidget(
                assetName: AssetsManager.imgLogo,
              ).marginOnly(
                start: AppPadding.p4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
