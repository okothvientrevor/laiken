import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';

class VFormDivider extends StatelessWidget {
  const VFormDivider({
    super.key,
    required this.dark,
    required this.dividerText,
  });

  final bool dark;
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: dark ? VColors.darkGrey : VColors.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5),
        ),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
              color: dark ? VColors.darkGrey : VColors.grey,
              thickness: 0.5,
              indent: 5,
              endIndent: 60),
        )
      ],
    );
  }
}
