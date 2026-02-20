import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/app_routes.dart';
import 'widgets/lottie_illustration.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingPageData> _pages = [
    _OnboardingPageData(
      illustration: Image.asset(
        'assets/images/save.png',
        width: 200,
        height: 200,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: Icon(Icons.favorite, size: 80, color: AppColors.deepNavy),
          ),
        ),
      ),
      title: 'Save Lives',
      description:
          'With LifeLine, you are in the position to save lives during emergency situations.',
    ),
    _OnboardingPageData(
      illustration: LottieIllustration(
        assetPath: 'assets/lottie/first_aid.json',
        fallback: const _FirstAidIllustration(),
        width: 200,
        height: 200,
      ),
      title: 'First Aid Kits & Tips',
      description:
          'Get access to first aid kits and tips curated by specialists just for you.',
    ),
    _OnboardingPageData(
      illustration: Image.asset(
        'assets/images/doc.png',
        width: 200,
        height: 200,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => const _DoctorIllustration(),
      ),
      title: 'Doctors At Your Reach',
      description:
          'Speak to doctors about medical issues you are facing without stress.',
    ),
  ];

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    } else {
      Get.offAllNamed(AppRoutes.welcome);
    }
  }

  void _skip() {
    Get.offAllNamed(AppRoutes.welcome);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: _skip,
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _OnboardingPage(data: _pages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == _currentPage ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: index == _currentPage
                              ? AppColors.deepNavy
                              : AppColors.border,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      if (_currentPage > 0)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _pageController.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeOutCubic,
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.deepNavy,
                              side: const BorderSide(color: AppColors.border),
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Icon(Icons.arrow_back_rounded),
                          ),
                        ),
                      if (_currentPage > 0) const SizedBox(width: 16),
                      Expanded(
                        flex: _currentPage > 0 ? 1 : 1,
                        child: ElevatedButton(
                          onPressed: _nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.deepNavy,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            _currentPage < _pages.length - 1
                                ? 'Next'
                                : 'Get Started',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({required this.data});

  final _OnboardingPageData data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          const SizedBox(height: 32),
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              color: AppColors.navySoft,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: AppColors.deepNavy.withValues(alpha: 0.06),
                  blurRadius: 32,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: data.illustration,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.lifelineText,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 16,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _OnboardingPageData {
  final Widget illustration;
  final String title;
  final String description;

  _OnboardingPageData({
    required this.illustration,
    required this.title,
    required this.description,
  });
}

class _FirstAidIllustration extends StatelessWidget {
  const _FirstAidIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.deepNavy.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.medical_services,
                size: 40,
                color: AppColors.deepNavy,
              ),
            ),
          ),
          Positioned(left: 20, top: 40, child: _medicalIcon(Icons.medication)),
          Positioned(right: 20, top: 40, child: _medicalIcon(Icons.healing)),
          Positioned(left: 10, bottom: 60, child: _medicalIcon(Icons.vaccines)),
          Positioned(right: 10, bottom: 60, child: _medicalIcon(Icons.favorite)),
          Positioned(left: 50, bottom: 20, child: _medicalIcon(Icons.medication_liquid)),
          Positioned(right: 50, bottom: 20, child: _medicalIcon(Icons.medical_information)),
        ],
      ),
    );
  }

  Widget _medicalIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepNavy.withValues(alpha: 0.06),
            blurRadius: 8,
          ),
        ],
      ),
      child: Icon(icon, size: 20, color: AppColors.deepNavy),
    );
  }
}

class _DoctorIllustration extends StatelessWidget {
  const _DoctorIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(left: 30, top: 30, child: _plusIcon()),
          Positioned(right: 30, top: 50, child: _plusIcon()),
          Positioned(left: 50, bottom: 80, child: _plusIcon()),
          Positioned(right: 50, bottom: 60, child: _plusIcon()),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: AppColors.navyLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person_rounded, size: 45, color: AppColors.deepNavy),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 90,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.deepNavy.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.medical_services, size: 32, color: AppColors.deepNavy),
                      const SizedBox(height: 4),
                      Container(
                        width: 36,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.border,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _plusIcon() {
    return Icon(
      Icons.add,
      color: AppColors.deepNavy.withValues(alpha: 0.2),
      size: 22,
    );
  }
}
