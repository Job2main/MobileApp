import 'package:flutter/material.dart';
import 'package:job2main/utils/constants/sizes.dart';

class THeader extends StatelessWidget {
  final String? image;
  final String title;
  final String subtitle;

  const THeader({
    super.key,
    this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (image != null) Image(height: 150, image: AssetImage(image!)),
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TSizes.sm),
        Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
