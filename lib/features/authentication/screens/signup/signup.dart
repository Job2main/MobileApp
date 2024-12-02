import 'package:flutter/material.dart';
import 'package:job2main/features/authentication/screens/common/form_divider.dart';
import 'package:job2main/features/authentication/screens/common/social_button.dart';
import 'package:job2main/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              SignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TFormDivider(),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
