import 'package:flutter/material.dart';
import 'package:store/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:store/utils/theme/custom_themes/check_box_theme.dart';
import 'package:store/utils/theme/custom_themes/chip_theme.dart';
import 'package:store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:store/utils/theme/custom_themes/text_theme.dart';

class VAppTheme {
  VAppTheme._();
// Light Theme
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: VTextTheme.lightTextTheme,
      chipTheme: VChipTheme.lightChipTheme,
      appBarTheme: VAppBarTheme.lightAppBarTheme,
      checkboxTheme: VCheckBoxTheme.lightCheckboxTheme,
      bottomSheetTheme: VBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: VElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: VOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: VTextFieldTheme.lightTextFormFieldTheme);

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: VTextTheme.darkTextTheme,
      chipTheme: VChipTheme.darkChipTheme,
      appBarTheme: VAppBarTheme.darkAppBarTheme,
      checkboxTheme: VCheckBoxTheme.darkCheckboxTheme,
      bottomSheetTheme: VBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: VElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: VOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: VTextFieldTheme.darkTextFormFieldTheme);
}
