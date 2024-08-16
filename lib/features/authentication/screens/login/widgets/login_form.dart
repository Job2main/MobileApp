import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(children: [
        const EmailTextFormFIeld(),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        const PwdTextFormField(),
        const SizedBox(height: TSizes.spaceBtwInputFields / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                const Text(TTexts.rememberMe)
              ],
            ),
            TextButton(
                onPressed: () {}, child: const Text(TTexts.forgetPassword))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: const Text(TTexts.signIn))),
        const SizedBox(height: TSizes.spaceBtwItems),
        SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {}, child: const Text(TTexts.createAccount))),
      ]),
    ));
  }
}

class PwdTextFormField extends StatelessWidget {
  const PwdTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Iconsax.password_check),
        labelText: TTexts.password,
        suffixIcon: Icon(Iconsax.eye_slash),
      ),
    );
  }
}

class EmailTextFormFIeld extends StatelessWidget {
  const EmailTextFormFIeld({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Iconsax.direct_right),
        labelText: TTexts.email,
      ),
    );
  }
}
