import 'package:go_router/go_router.dart';
import 'package:workiom/core/util/app_context.dart';
import 'package:workiom/features/auth/ui/complete_info/view/complete_info_view.dart';
import 'package:workiom/features/auth/ui/confirm_password/view/confirm_password_view.dart';
import 'package:workiom/features/generic/ui/onboarding/view/onboarding_view.dart';
import 'package:workiom/features/generic/ui/splash/view/splash_view.dart';
import 'package:workiom/features/generic/ui/undefined_route/view/undefined_route_view.dart';
import 'package:workiom/features/home/ui/home_view.dart';

import 'app_router.dart';
import 'app_routes.dart';

class RouterManager {
  static final GoRouter router = GoRouter(
    navigatorKey: AppContext.navigatorKey,
    initialLocation: '/',
    routes: [
      AppRouter(
        mPath: '/',
        mName: AppRoutes.splashRoute,
        screen: const SplashView(),
      ),
      AppRouter(
        mName: AppRoutes.onboardingRoute,
        screen: const OnboardingView(),
      ),
      AppRouter(
        mName: AppRoutes.confirmPasswordRoute,
        screen: const ConfirmPasswordView(),
      ),
      AppRouter(
        mName: AppRoutes.completeInfoRoute,
        screen: const CompleteInfoView(),
      ),
      AppRouter(
        mName: AppRoutes.homeRoute,
        screen: const HomeView(),
      ),
    ],
    errorBuilder: (context, state) => const UnDefinedRouteView(),
  );
}
