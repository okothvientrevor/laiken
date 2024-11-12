import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VRatingAndShare extends StatelessWidget {
  const VRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: VSizes.spaceBtwItems / 2,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "5.0", style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: "(199)")
            ]))
          ],
        ), // Share Button

        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              size: VSizes.iconMd,
              color: dark ? VColors.white : VColors.dark,
            ))
      ],
    );
  }
}
