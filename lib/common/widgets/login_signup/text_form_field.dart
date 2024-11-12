import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VTextFormField extends StatelessWidget {
  const VTextFormField(
      {super.key,
      required this.icon,
      required this.label,
      this.controller,
      this.validator});

  final Icon icon;
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return TextFormField(
      expands: false,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: dark ? VColors.light : VColors.dark),
        labelText: label,
        prefixIcon: icon,
        errorStyle: const TextStyle(color: Colors.red),
        floatingLabelStyle:
            TextStyle(color: dark ? VColors.light : VColors.dark),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: Colors.blue), // Border color on focus
        ),
      ),
    );
  }
}
