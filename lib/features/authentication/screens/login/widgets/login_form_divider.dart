import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:job2main/utils/helpers/any_color_mode.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: TAnyMode.getDividerColor(context),
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(TTexts.orSignInWith.capitalize!,
            style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: TAnyMode.getDividerColor(context),
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
