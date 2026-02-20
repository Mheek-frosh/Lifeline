import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.deepNavy,
        secondary: AppColors.safetyGreen,
        surface: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.lifelineText,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.lifelineText,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
        headlineMedium: TextStyle(
          color: AppColors.lifelineText,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        bodyLarge: TextStyle(
          color: AppColors.lifelineText,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: AppColors.lifelineText,
          fontSize: 14,
        ),
      ),
    );
  }
}
