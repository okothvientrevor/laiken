import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/styles/shadows.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:store/common/widgets/icons/v_circular_icon.dart';
import 'package:store/common/widgets/images/v_rounded_image.dart';
import 'package:store/common/widgets/products/product_cards/product_price_text.dart';
import 'package:store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:store/common/widgets/texts/product_title_text.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VProductCardHorizontal extends StatelessWidget {
  const VProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    // Container with side paddings, color, edges, radius and shadow
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          boxShadow: [VShadowStyles.verticalProductShadow],
          borderRadius: BorderRadius.circular(VSizes.productImageRadius),
          color: dark ? VColors.darkerGrey : VColors.softGrey),
      child: Row(
        children: [
          // Thumbnail
          VRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(VSizes.sm),
            backgroundColor: dark ? VColors.dark : VColors.white,
            child: Stack(
              children: [
                // Thumbnail Image

                const SizedBox(
                  height: 120,
                  width: 120,
                  child: VRoundedImage(
                    imageUrl: VImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                //  Sale Tag
                Positioned(
                  top: 12,
                  child: VRoundedContainer(
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
                ),

                // Favorite Icon Button
                Positioned(
                  top: 0,
                  right: 0,
                  child: VCircularIcon(
                    dark: dark,
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),

          //  Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: VSizes.sm, left: VSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      VProductTitleText(
                        title: "Green Nike Half Sleeves shirt",
                        smallSize: true,
                      ),
                      SizedBox(
                        height: VSizes.spaceBtwItems / 2,
                      ),
                      VBrandTitleTextWithVerifiedIcon(title: "Nike")
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Pricing

                      const Flexible(
                          child: VProductPriceText(price: "260,000")),

                      // Add to cart
                      Container(
                        decoration: const BoxDecoration(
                            color: VColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(VSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    VSizes.productImageRadius))),
                        child: const SizedBox(
                          width: VSizes.iconLg * 1.2,
                          height: VSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: VColors.white,
                            ),
                          ),
                        ),
                      )

                      //
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
