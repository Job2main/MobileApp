import 'package:flutter/material.dart';
import 'package:job2main/common/styles/spacing_styles.dart';
import 'package:job2main/features/authentication/screens/login/widgets/login_header.dart';
import 'package:job2main/features/authentication/screens/login/widgets/login_form_divider.dart';
import 'package:job2main/features/authentication/screens/login/widgets/login_form.dart';
import 'package:job2main/features/authentication/screens/login/widgets/login_social_button.dart';
import 'package:job2main/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: TSpacingStyle.paddingWithAppBarHeight,
                child: Column(children: [
                  TLoginHeader(),
                  TLoginForm(),
                  TFormDivider(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSocialButton()
                ]))));
  }
}
