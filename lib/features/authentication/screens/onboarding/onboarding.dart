import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: VImages.onBoardingImage1,
                title: VTexts.onBoardingTitle1,
                subTitle: VTexts.onBoardingSubTitle1,
              ),
              OnboardingPage(
                image: VImages.onBoardingImage2,
                title: VTexts.onBoardingTitle2,
                subTitle: VTexts.onBoardingSubTitle2,
              ),
              OnboardingPage(
                image: VImages.onBoardingImage3,
                title: VTexts.onBoardingTitle3,
                subTitle: VTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip Button
          const OnboardingSkip(),

          // Dot Navigation SmoothPageIndicator
          const OnboardingDotNavigation(),

          // Dot Navigation SmoothPageIndicator
          const OnboardingCircularButton(),

          // Circular Button
          const OnboardingCircularButton()
        ],
      ),
    );
  }
}
