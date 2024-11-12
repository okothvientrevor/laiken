import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class VCircularIcon extends StatelessWidget {
  const VCircularIcon({
    super.key,
    required this.dark,
    this.width,
    this.height,
    this.size = VSizes.lg,
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.color,
  });

  final bool dark;
  final double? width;
  final double? height;
  final double? size;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : dark
                ? VColors.black.withOpacity(0.9)
                : VColors.light.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size,
          )),
    );
  }
}
