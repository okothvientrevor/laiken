import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VSearchContainer extends StatelessWidget {
  const VSearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.showBackground = true,
      this.showBorder = true,
      this.onTap,
      this.padding =
          const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace)});

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: VDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(VSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? VColors.dark
                      : VColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(VSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: VColors.grey) : null),
          child: Row(
            children: [
              Icon(
                icon,
                color: VColors.darkGrey,
              ),
              const SizedBox(
                width: VSizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: VColors.darkGrey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
