import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job2main/common/widgets/ui_utils.dart';
import 'package:job2main/features/authentication/screens/login/widgets/login_form_buttons.dart';
import 'package:job2main/features/authentication/screens/login/widgets/login_utilities.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  TLoginForm({
    super.key,
  });

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(children: [
          getFormField(_email, TTexts.email, Iconsax.direct_right),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          getFormField(_password, TTexts.password, Iconsax.password_check, suffixIcon: Iconsax.eye_slash),
          const SizedBox(height: TSizes.spaceBtwInputFields / 2),
          const LoginUtilities(),
          const SizedBox(height: TSizes.spaceBtwItems),
          LoginFormButtons(email: _email, password: _password),
        ]),
      )
    );
  }
}
