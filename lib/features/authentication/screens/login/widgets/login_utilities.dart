import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:job2main/utils/constants/text_strings.dart';

class LoginUtilities extends StatelessWidget {
  const LoginUtilities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [Checkbox(value: true, onChanged: (value) {}), const Text(TTexts.rememberMe)],
        ),
        TextButton(
            onPressed: () => Get.to(() => const ForgetPassword()),
            child: const Text(TTexts.forgetPassword))
      ],
    );
  }
}
