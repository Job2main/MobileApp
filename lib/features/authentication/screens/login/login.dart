import 'package:flutter/material.dart';
import 'package:job2main/common/styles/spacing_styles.dart';
import 'package:job2main/features/authentication/screens/common/header.dart';
import 'package:job2main/features/authentication/screens/common/form_divider.dart';
import 'package:job2main/features/authentication/screens/login/widgets/login_form.dart';
import 'package:job2main/features/authentication/screens/common/social_button.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:job2main/utils/theme/widget_themes/logo_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: TSpacingStyle.paddingWithAppBarHeight,
                child: Column(children: [
                  THeader(
                      image: TAnyMode.getLogo(context),
                      title: TTexts.loginTitle,
                      subtitle: TTexts.loginSubTitle),
                  TLoginForm(),
                  const TFormDivider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSocialButton()
                ]))));
  }
}
