import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Spacer(flex: 1),
                    _buildHeader(),
                    const Spacer(flex: 1),
                    _buildFeatures(),
                    const Spacer(flex: 2),
                    _buildActions(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/images/ab.png',
          height: 120,
          width: 120,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Icon(
            Icons.medical_services_rounded,
            size: 100,
            color: AppColors.deepNavy,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Welcome to',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'LifeLine',
          style: TextStyle(
            color: AppColors.lifelineText,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Your trusted healthcare companion',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatures() {
    final features = [
      ('Be a hero, save lives', Icons.favorite_rounded),
      ('First aid kits & tips', Icons.medical_services_rounded),
      ('Doctors with a click', Icons.person_rounded),
      ('SOS during emergencies', Icons.emergency_rounded),
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.navySoft,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepNavy.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          for (int i = 0; i < features.length; i++) ...[
            _buildFeatureRow(features[i].$1, features[i].$2),
            if (i < features.length - 1)
              Divider(
                height: 28,
                color: AppColors.border,
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String text, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.deepNavy.withValues(alpha: 0.06),
                blurRadius: 8,
              ),
            ],
          ),
          child: Icon(icon, size: 22, color: AppColors.deepNavy),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.lifelineText,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(AppRoutes.onboard),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.deepNavy,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              'Join LifeLine',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              // TODO: Navigate to login
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.deepNavy,
              side: const BorderSide(color: AppColors.border),
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              'Login to LifeLine',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
