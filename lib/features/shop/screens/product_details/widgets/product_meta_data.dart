import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:store/common/widgets/images/v_circular_image.dart';
import 'package:store/common/widgets/products/product_cards/product_price_text.dart';
import 'package:store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:store/common/widgets/texts/product_title_text.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VProductMetaData extends StatelessWidget {
  const VProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & Sale Price
        Row(
          children: [
            // Sale Tag
            VRoundedContainer(
              radius: VSizes.sm,
              backgroundColor: VColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: VSizes.sm, vertical: VSizes.xs),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: VColors.black),
              ),
            ),
            const SizedBox(
              width: VSizes.spaceBtwItems,
            ),

            // Price
            Text(
              "Ush200,000",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: VSizes.spaceBtwItems,
            ),
            const VProductPriceText(
              price: "170,000",
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),

        // Title
        const VProductTitleText(title: "Green Nike Sports Shirt"),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),

        // Stock status
        Row(
          children: [
            const VProductTitleText(
              title: "Status",
            ),
            const SizedBox(
              width: VSizes.spaceBtwItems,
            ),
            Text(
              "In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),

        // Brand
        Row(
          children: [
            VCircularImage(
              dark: dark,
              image: VImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? VColors.white : VColors.black,
            ),
            const VBrandTitleTextWithVerifiedIcon(
              title: "Nike",
              brandTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
