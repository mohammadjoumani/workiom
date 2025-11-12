import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/core/app_widgets/app_loading_widget.dart';
import 'package:workiom/core/app_widgets/app_svg_picture_widget.dart';
import 'package:workiom/core/resource/assets_manager.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';
import 'package:workiom/core/routes/app_routes.dart';

class SplashViewBody extends ConsumerStatefulWidget {
  const SplashViewBody({super.key});

  @override
  ConsumerState<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends ConsumerState<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _goNext();
    });
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
            assetName: AssetsManager.imgLogo,
            width: AppSize.s120,
            height: AppSize.s54,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 100,
              child: AppLoadingWidget(
                color: ColorManager.colorPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goNext() {
    context.goNamed(AppRoutes.onboardingRoute);
  }
}
