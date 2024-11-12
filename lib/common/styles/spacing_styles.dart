import 'package:flutter/material.dart';
import 'package:store/utils/constants/sizes.dart';

class VSpacingStyle {
  static EdgeInsetsGeometry paddingWithAppbarHeight = const EdgeInsets.only(
      top: VSizes.appBarHeight,
      left: VSizes.defaultSpace,
      right: VSizes.defaultSpace,
      bottom: VSizes.defaultSpace);
}
