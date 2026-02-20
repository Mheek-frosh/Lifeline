import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Messages',
                style: TextStyle(
                  color: AppColors.lifelineText,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Chat with doctors',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Center(
                child: Icon(
                  Icons.chat_bubble_rounded,
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
