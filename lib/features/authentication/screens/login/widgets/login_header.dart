import 'package:flutter/material.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:job2main/utils/helpers/any_color_mode.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(height: 150, image: AssetImage(TAnyMode.getLogo(context))),
        Text(TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TSizes.sm),
        Text(TTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
