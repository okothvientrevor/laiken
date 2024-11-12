import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:store/utils/constants/sizes.dart';
// import 'package:store/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const VBottomAddToCartWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Product image slider
            const VProductImageSlider(),

            // 2. Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: VSizes.defaultSpace,
                  left: VSizes.defaultSpace,
                  bottom: VSizes.defaultSpace),
              child: Column(
                children: [
                  // Rating & Share

                  const VRatingAndShare(),

                  // Price, Title, Stock & Brand
                  const VProductMetaData(),

                  // Attributes
                  const VProductAttributes(),

                  // Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Checkout"))),

                  const SizedBox(height: VSizes.spaceBtwItems),

                  // Description
                  const VSectionHeading(
                    title: "Description",
                    showActionButton: false,
                  ),

                  const SizedBox(height: VSizes.spaceBtwItems),

                  const ReadMoreText(
                    "This is a Product description for Blue Nike Sleeveless Vest. There are more things that can be added, but we shall start with this",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show more",
                    trimExpandedText: " Less",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // Reviews
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const VSectionHeading(
                        title: "Reviews(199)",
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen()),
                          icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
