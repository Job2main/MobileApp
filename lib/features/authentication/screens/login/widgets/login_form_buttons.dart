import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/common/widgets/navigation_bar/navigation_menu.dart';
import 'package:job2main/features/authentication/controllers/usertype_controller.dart';
import 'package:job2main/features/authentication/screens/signup/signup.dart';
import 'package:job2main/features/employer/employer_home.dart';
import 'package:job2main/features/worker/worker_home.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';

class LoginFormButtons extends StatelessWidget {
  const LoginFormButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserTypeController userTypeController = Get.find<UserTypeController>();

    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (userTypeController.userType.value == UserType.employer) {
                    Get.to(() => const EmployerHomeScreen());
                  } else {
                    Get.to(() => const NavigationMenu());
                  }
                },
                child: const Text(TTexts.signIn))),
        const SizedBox(height: TSizes.spaceBtwItems),
        SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(TTexts.createAccount))),
      ],
    );
  }
}
