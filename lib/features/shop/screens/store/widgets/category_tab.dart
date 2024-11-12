import 'package:flutter/material.dart';
import 'package:store/common/widgets/brands/brand_showcase.dart';
import 'package:store/common/widgets/layouts/grid_layout.dart';
import 'package:store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VCategoryTab extends StatelessWidget {
  const VCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              VBrandShowcase(
                dark: dark,
                images: const [
                  VImages.productImage3,
                  VImages.productImage4,
                  VImages.productImage5,
                ],
              ),

              // Products you may like

              VSectionHeading(
                title: "You might like",
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),

              VGridLayout(
                  itemCount: 4,
                  itemBuider: (_, index) => const VProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
