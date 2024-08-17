import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job2main/utils/constants/text_strings.dart';

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
