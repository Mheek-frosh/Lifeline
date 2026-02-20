import 'package:get/get.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/welcome/welcome_screen.dart';
import '../screens/onboard/onboard_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.onboard,
      page: () => const OnboardScreen(),
    ),
  ];
}
