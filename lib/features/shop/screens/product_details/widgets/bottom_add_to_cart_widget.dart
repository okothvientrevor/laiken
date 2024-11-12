import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/icons/v_circular_icon.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VBottomAddToCartWidget extends StatelessWidget {
  const VBottomAddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: VSizes.defaultSpace, vertical: VSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? VColors.darkerGrey : VColors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(VSizes.cardRadiusLg),
              topRight: Radius.circular(VSizes.cardRadiusLg))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              VCircularIcon(
                dark: dark,
                icon: Iconsax.minus,
                backgroundColor: VColors.darkGrey,
                width: 40,
                height: 40,
                color: VColors.white,
              ),
              const SizedBox(width: VSizes.spaceBtwItems),
              Text(
                "2",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: VSizes.spaceBtwItems),
              VCircularIcon(
                dark: dark,
                icon: Iconsax.add,
                backgroundColor: VColors.black,
                width: 40,
                height: 40,
                color: VColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(VSizes.md),
                backgroundColor: VColors.black,
                side: const BorderSide(color: VColors.black)),
            child: const Text("Add to Cart"),
          )
        ],
      ),
    );
  }
}
