import 'package:flutter/material.dart';
import 'package:job2main/features/authentication/controllers/onboarding_controller.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () {},
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ),
      ),
    );
  }
}
