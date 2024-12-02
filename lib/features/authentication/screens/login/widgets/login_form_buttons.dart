import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/common/widgets/navigation_bar/navigation_menu.dart';
import 'package:job2main/features/authentication/controllers/usertype_controller.dart';
import 'package:job2main/features/authentication/screens/signup/signup.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:provider/provider.dart';

class LoginFormButtons extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  LoginFormButtons({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    final UserTypeController userTypeController = Get.find<UserTypeController>();
    final userController = Provider.of<UserController>(context);

    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (email.text.isEmpty || password.text.isEmpty) {
                    Get.snackbar(TTexts.error, TTexts.allFieldsRequired);
                    return;
                  }

                  userController.login(email.text, password.text);
                  if (userController.currentUser == null) {
                    Get.snackbar(TTexts.error, TTexts.invalidCredentials);
                    return;
                  }

                  if (userTypeController.userType.value == UserType.employer) {
                    Get.to(() => EmployerNavigation());
                  } else {
                    Get.to(() => WorkerNavigation());
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
