import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Shows Lottie animation with fallback to custom illustration on error
class LottieIllustration extends StatelessWidget {
  const LottieIllustration({
    super.key,
    required this.assetPath,
    required this.fallback,
    this.width = 220,
    this.height = 220,
  });

  final String assetPath;
  final Widget fallback;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Lottie.asset(
        assetPath,
        width: width,
        height: height,
        fit: BoxFit.contain,
        repeat: true,
        errorBuilder: (_, __, ___) => fallback,
      ),
    );
  }
}
