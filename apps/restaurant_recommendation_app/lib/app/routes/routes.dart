import 'package:auto_route/auto_route_annotations.dart';
import 'package:restaurant_recommendation_app/app/pages/home/home.dart';
import 'package:restaurant_recommendation_app/app/pages/onboarding/onboarding.dart';
import 'package:restaurant_recommendation_app/app/pages/onboarding/welcome.dart';

/// Run this in a new terminal to generate new routes upon edit:
/// flutter packages pub run build_runner watch --delete-conflicting-outputs
@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(
      page: WelcomePage,
      initial: true,
    ),
    AdaptiveRoute(
      page: OnboardingPage,
    ),
    AdaptiveRoute(
      page: HomePage,
    ),
  ],
)
class $Router {}
