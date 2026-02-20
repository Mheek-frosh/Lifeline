import 'package:get/get.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/welcome/welcome_screen.dart';
import '../screens/onboard/onboard_screen.dart';
import '../screens/auth/sign_in_screen.dart';
import '../screens/auth/forget_password_screen.dart';
import '../screens/auth/otp_sent_screen.dart';
import '../screens/auth/password_reset_screen.dart';
import '../screens/auth/account_success_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
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
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.otpSent,
      page: () => const OtpSentScreen(),
    ),
    GetPage(
      name: AppRoutes.enterOtp,
      page: () => const OtpSentScreen(),
    ),
    GetPage(
      name: AppRoutes.passwordReset,
      page: () => const PasswordResetScreen(),
    ),
    GetPage(
      name: AppRoutes.accountSuccess,
      page: () => const AccountSuccessScreen(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardScreen(),
    ),
  ];
}
