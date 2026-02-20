import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'LifeLine',
          style: TextStyle(
            color: AppColors.lifelineText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to LifeLine',
                style: TextStyle(
                  color: AppColors.lifelineText,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your healthcare companion',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Center(
                child: Icon(
                  Icons.medical_services_rounded,
                  size: 80,
                  color: AppColors.deepNavy.withValues(alpha: 0.3),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
