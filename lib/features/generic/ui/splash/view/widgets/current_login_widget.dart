import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/core/app_widgets/app_button_widget.dart';
import 'package:workiom/core/app_widgets/app_loading_widget.dart';
import 'package:workiom/core/extension/widget_extension.dart';
import 'package:workiom/core/resource/color_manager.dart';
import 'package:workiom/core/resource/values_manager.dart';
import 'package:workiom/core/routes/app_routes.dart';
import 'package:workiom/core/util/data_state.dart';
import 'package:workiom/features/generic/ui/splash/controller/splash_state.dart';
import 'package:workiom/features/generic/ui/splash/providers/splash_controller_provider.dart';

class CurrentLoginWidget extends ConsumerWidget {
  const CurrentLoginWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(
      splashControllerProvider.select(
        (value) => value.getCurrentLoginDataState,
      ),
    );

    final failure = ref.read(
      splashControllerProvider.select(
        (value) => value.failure,
      ),
    );

    ref.listen(
      splashControllerProvider,
      (previous, next) => submitRegisterListener(context, previous, next),
    );

    switch (state) {
      case DataState.failure:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              failure?.message ?? '',
            ).marginOnly(
              bottom: AppPadding.p4,
            ),
            SizedBox(
              width: 100,
              child: AppButtonWidget.primary(
                label: 'Retry',
                onPressed: () {},
                buttonSize: ButtonSize.small,
              ),
            ),
          ],
        );
      default:
        return const SizedBox(
          height: 100,
          child: AppLoadingWidget(
            color: ColorManager.colorPrimary,
          ),
        );
    }
  }

  void submitRegisterListener(BuildContext context, SplashState? previous, SplashState next) {
    if (previous?.getCurrentLoginDataState != next.getCurrentLoginDataState) {
      if (next.getCurrentLoginDataState == DataState.success) {
        if (next.currentLogin?.user == null && next.currentLogin?.tenant == null) {
          context.goNamed(AppRoutes.onboardingRoute);
        } else if (next.currentLogin?.user != null && next.currentLogin?.tenant == null) {
          context.goNamed(AppRoutes.completeInfoRoute);
        } else {
          context.goNamed(AppRoutes.homeRoute);
        }
      }
    }
  }
}
