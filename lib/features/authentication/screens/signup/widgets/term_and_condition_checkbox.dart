import 'package:flutter/material.dart';
import 'package:job2main/utils/constants/colors.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:job2main/utils/helpers/helper_functions.dart';

class TermAndConditionCheckbox extends StatelessWidget {
  const TermAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final linkTheme = Theme.of(context).textTheme.bodyMedium!.apply(
          color: dark ? TColors.white : TColors.primary,
          decoration: TextDecoration.underline,
          decorationColor: dark ? TColors.white : TColors.primary,
        );
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: true,
              onChanged: (value) {},
            )),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: TTexts.privacyPolicy,
            style: linkTheme,
          ),
          TextSpan(
              text: ' ${TTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: TTexts.termsOfUse,
            style: linkTheme,
          ),
        ]))
      ],
    );
  }
}
