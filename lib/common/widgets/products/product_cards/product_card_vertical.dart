import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class VProductCardVertical extends StatelessWidget {
  const VProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    // Container with side paddings, color, edges, radius and shadow
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [VShadowStyles.verticalProductShadow],
            borderRadius: BorderRadius.circular(VSizes.productImageRadius),
            color: dark ? VColors.darkerGrey : VColors.white),
        child: Column(
          children: [
            // Thumbnail, wishlist button, Discount tag
            VRoundedContainer(
              height: 150,
              // padding: EdgeInsets.all(VSizes.sm),
              backgroundColor: dark ? VColors.dark : VColors.light,
              child: Stack(
                children: [
                  // Thumbnail Image
                  const VRoundedImage(
                    imageUrl: VImages.productImage1,
                    applyImageRadius: true,
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
            const SizedBox(
              height: VSizes.spaceBtwItems / 2,
            ),

            // Details
            const Padding(
              padding: EdgeInsets.only(left: VSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VProductTitleText(
                    title: "Green Nike Air Shoes",
                    smallSize: true,
                  ),
                  SizedBox(
                    height: VSizes.spaceBtwItems / 4,
                  ),
                  VBrandTitleTextWithVerifiedIcon(
                    title: "Nike",
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price

                const VProductPriceText(
                  price: '140,000',
                ),

                // Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                      color: VColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(VSizes.cardRadiusMd),
                          bottomRight:
                              Radius.circular(VSizes.productImageRadius))),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
