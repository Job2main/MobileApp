import 'package:flutter/material.dart';
import 'package:job2main/features/authentication/screens/login/widgets/login_form_buttons.dart';
import 'package:job2main/features/authentication/screens/login/widgets/login_utilities.dart';
import 'package:job2main/features/authentication/screens/common/form_fields.dart';
import 'package:job2main/utils/constants/sizes.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Form(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(children: [
        EmailTextFormFIeld(),
        SizedBox(height: TSizes.spaceBtwInputFields),
        PwdTextFormField(),
        SizedBox(height: TSizes.spaceBtwInputFields / 2),
        LoginUtilities(),
        SizedBox(height: TSizes.spaceBtwItems),
        LoginFormButtons(),
      ]),
    ));
  }
}
