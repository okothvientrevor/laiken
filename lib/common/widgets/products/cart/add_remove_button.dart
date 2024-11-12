import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/icons/v_circular_icon.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class VProductQuantityWithAddAndRemove extends StatelessWidget {
  const VProductQuantityWithAddAndRemove({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        VCircularIcon(
          dark: dark,
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: VSizes.md,
          color: dark ? VColors.white : VColors.dark,
          backgroundColor: dark ? VColors.darkerGrey : VColors.light,
        ),
        const SizedBox(
          width: VSizes.spaceBtwItems / 2,
        ),
        Text(
          "2",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: VSizes.spaceBtwItems / 2,
        ),
        VCircularIcon(
          dark: dark,
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: VSizes.md,
          color: VColors.white,
          backgroundColor: VColors.primaryColor,
        ),
      ],
    );
  }
}
