import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/common/widgets/navigation_bar/navigation_menu.dart';
import 'package:job2main/features/authentication/controllers/usertype_controller.dart';
import 'package:job2main/features/authentication/screens/signup/signup.dart';
import 'package:job2main/utils/constants/enums.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:provider/provider.dart';

class LoginFormButtons extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController password;

  const LoginFormButtons({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  _LoginFormButtonsState createState() => _LoginFormButtonsState();
}

class _LoginFormButtonsState extends State<LoginFormButtons> {
  bool _isLoading = false;

  Future<void> login(UserController userController, UserTypeController userTypeController) async {
    if (widget.email.text.isEmpty || widget.password.text.isEmpty) {
      Get.snackbar(TTexts.error, TTexts.allFieldsRequired);
      return;
    }

    setState(() {
      _isLoading = true;
    });
    bool isUserLoggedIn = false;
    try {
      isUserLoggedIn = await userController.login(userTypeController.userType.value, widget.email.text, widget.password.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
      });
      Get.snackbar(TTexts.error, e.message!);
      return;
    }
  
    setState(() {
      _isLoading = false;
    });

    if (userTypeController.userType.value == UserType.employer) {
      Get.to(() => EmployerNavigation());
    } else {
      Get.to(() => WorkerNavigation());
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserTypeController userTypeController = Get.find<UserTypeController>();
    final UserController userController = Get.find<UserController>();

    return Column(
      children: [
        if (_isLoading)
          const CircularProgressIndicator()
        else ...[
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                login(userController, userTypeController);
              },
              child: const Text(TTexts.signIn),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => const SignupScreen()),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ],
    );
  }
}
