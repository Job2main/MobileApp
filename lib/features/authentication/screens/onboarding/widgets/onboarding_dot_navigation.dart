import 'package:flutter/material.dart';
import 'package:job2main/features/authentication/controllers/onboarding_controller.dart';
import 'package:job2main/utils/constants/colors.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/device/device_utility.dart';
import 'package:job2main/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    final activeColor = dark ? TColors.white : TColors.dark;

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: (index) => controller.dotNavigationClick(index),
        count: controller.pageCount, // Use dynamic page count from the controller
        effect: ExpandingDotsEffect(
          activeDotColor: activeColor,
        ),
      ),
    );
  }
}
