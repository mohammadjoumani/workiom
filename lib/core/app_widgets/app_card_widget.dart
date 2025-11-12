import 'package:flutter/material.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';

import 'app_ripple_widget.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget({
    super.key,
    required this.child,
    this.onTap,
    this.onLongTap,
    this.backgroundColor = ColorManager.colorWhite1,
    this.borderRadius = AppSize.s8,
  });

  final Widget child;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongTap;
  final Color backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        shadows: const [ColorManager.genericBoxShadow],
      ),
      child: AppRippleWidget(
        radius: borderRadius,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
