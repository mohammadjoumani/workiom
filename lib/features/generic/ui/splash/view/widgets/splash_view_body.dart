import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workiom/core/app_widgets/app_svg_picture_widget.dart';
import 'package:workiom/core/resource/assets_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';

import 'current_login_widget.dart';

class SplashViewBody extends ConsumerStatefulWidget {
  const SplashViewBody({super.key});

  @override
  ConsumerState<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends ConsumerState<SplashViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Text('Slash view'),
          AppSvgPictureWidget(
            assetName: AssetsManager.imgHorizontalLogo,
            width: AppSize.s120,
            height: AppSize.s54,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CurrentLoginWidget(),
          ),
        ],
      ),
    );
  }
}
