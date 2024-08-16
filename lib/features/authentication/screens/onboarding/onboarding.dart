import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:job2main/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:job2main/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:job2main/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:job2main/utils/constants/image_strings.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:job2main/features/authentication/controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageViewChildren = [
      const OnBoardingPage(
          image: TImages.onboarding1,
          title: TTexts.onBoardingTitle1,
          subTitle: TTexts.onBoardingSubTitle1),
      const OnBoardingPage(
          image: TImages.onboarding2,
          title: TTexts.onBoardingTitle2,
          subTitle: TTexts.onBoardingSubTitle2),
      const OnBoardingPage(
          image: TImages.onboarding1,
          title: TTexts.onBoardingTitle3,
          subTitle: TTexts.onBoardingSubTitle3),
    ];

    final int pageCount = pageViewChildren.length;

    final controller = Get.put(OnBoardingController(pageCount: pageCount));

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.currentPageIndex.value = index;
            },
            children: pageViewChildren,
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
