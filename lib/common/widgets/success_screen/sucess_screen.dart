import 'package:flutter/material.dart';
import 'package:job2main/common/styles/spacing_styles.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:job2main/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      this.onPressed});

  final String image, title, subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithDoubleAppBarHeight,
          child: Column(
            children: [
              Image(image: AssetImage(image), width: THelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(subTitle,
                  style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: onPressed, child: const Text(TTexts.tContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
