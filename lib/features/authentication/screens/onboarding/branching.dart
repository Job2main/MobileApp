import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/common/styles/spacing_styles.dart';
import 'package:job2main/features/authentication/controllers/usertype_controller.dart';
import 'package:job2main/features/authentication/screens/common/header.dart';
import 'package:job2main/features/authentication/screens/login/widgets/login_header.dart';
import 'package:job2main/features/authentication/screens/signup/signup.dart';
import 'package:job2main/utils/constants/colors.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:job2main/utils/helpers/any_color_mode.dart';

class BranchingScreen extends StatelessWidget {
  const BranchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserTypeController userTypeController = Get.put(UserTypeController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const THeader(
                title: TTexts.onBoardingChoiceTitle, subtitle: TTexts.onBoardingChoiceSubTitle),
            const SizedBox(height: TSizes.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: Get.width * 0.4,
                  child: ElevatedButton(
                      onPressed: () {
                        userTypeController.setUserType(UserType.employer);
                        Get.to(() => const SignupScreen());
                      },
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: const Text(TTexts.onBoardingEmployer)),
                ),
                SizedBox(
                  width: Get.width * 0.4,
                  child: ElevatedButton(
                      onPressed: () {
                        userTypeController.setUserType(UserType.worker);
                        Get.to(() => const SignupScreen());
                      },
                      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                            backgroundColor: WidgetStateProperty.all<Color>(TColors.custom4),
                          ),
                      child: const Text(TTexts.onBoardingWorker)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
