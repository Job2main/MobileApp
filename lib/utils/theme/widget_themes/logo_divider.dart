import 'package:flutter/material.dart';
import 'package:job2main/utils/constants/colors.dart';
import 'package:job2main/utils/constants/image_strings.dart';
import 'package:job2main/utils/helpers/others.dart';

class TAnyMode {
  static String getLogo(context) {
    return THelperFunctions.isDarkMode(context) ? TImages.darkLogo : TImages.lightLogo;
  }

  static Color getDividerColor(context) {
    return THelperFunctions.isDarkMode(context) ? TColors.grey : TColors.darkGrey;
  }
}
