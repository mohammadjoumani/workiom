import 'package:go_router/go_router.dart';
import 'package:workiom/core/util/app_context.dart';
import 'package:workiom/features/auth/ui/sign_up/view/sign_up_view.dart';
import 'package:workiom/features/generic/ui/onboarding/view/onboarding_view.dart';
import 'package:workiom/features/generic/ui/splash/view/splash_view.dart';
import 'package:workiom/features/generic/ui/undefined_route/view/undefined_route_view.dart';

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
        mName: AppRoutes.signUpRoute,
        screen: const SignUpView(),
      ),
      // AppRouter(
      //   mName: AppRoutes.underDevelopmentRoute,
      //   screen: const SizedBox(),
      // ),
    ],
    errorBuilder: (context, state) => const UnDefinedRouteView(),
  );
}
