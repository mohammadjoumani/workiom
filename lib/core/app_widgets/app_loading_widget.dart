import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key,
    this.size,
    this.color,
  });

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: size ?? AppSize.s24,
        color: color ?? ColorManager.colorWhite1,
      ),
    );
  }
}

void fullScreenLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const PopScope(
      canPop: false,
      child: Center(
        child: AppLoadingWidget(
          color: ColorManager.colorPrimary,
        ),
      ),
    ),
  );
}
