import 'package:flutter/material.dart';
import 'package:job2main/utils/constants/sizes.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
  );
  static const EdgeInsetsGeometry paddingWithDoubleAppBarHeight = EdgeInsets.only(
    top: TSizes.doubleAppBarHeight,
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
  );
}
