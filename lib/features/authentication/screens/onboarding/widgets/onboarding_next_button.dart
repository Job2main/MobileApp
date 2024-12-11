import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job2main/features/authentication/controllers/onboarding_controller.dart';
import 'package:job2main/utils/constants/colors.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/helpers/device_utility.dart';
import 'package:job2main/utils/helpers/others.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final backgroundColor = dark ? TColors.white : TColors.dark;

    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: backgroundColor,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
