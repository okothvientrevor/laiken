import 'package:flutter/material.dart';
import 'package:store/common/widgets/chips/choice_chip.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:store/common/widgets/products/product_cards/product_price_text.dart';
import 'package:store/common/widgets/texts/product_title_text.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VProductAttributes extends StatelessWidget {
  const VProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        // Selected attributes Pricing and Description
        VRoundedContainer(
          padding: const EdgeInsets.all(VSizes.md),
          backgroundColor: dark ? VColors.darkerGrey : VColors.grey,
          child: Column(
            children: [
              // Title, Price and Stock status
              Row(
                children: [
                  const VSectionHeading(
                    title: "Variation",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: VSizes.spaceBtwItems / 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const VProductTitleText(
                            title: "Price: ",
                            smallSize: true,
                          ),

                          // Actual Price
                          Text(
                            "Ush20000",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: VSizes.spaceBtwItems / 2,
                          ),

                          // Sale Price
                          const VProductPriceText(price: "23,000")
                        ],
                      ),

                      // Stock
                      Row(
                        children: [
                          const VProductTitleText(
                            title: "Stock: ",
                            smallSize: true,
                          ),
                          Text("In Stock",
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              // Variation descriPtion
              const VProductTitleText(
                title:
                    "This is the description of the product and it can go upto 4 lines ",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems,
        ),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VSectionHeading(
              title: "Colors",
              showActionButton: false,
            ),
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            Wrap(
              children: [
                VChoiceChip(
                  text: "Green",
                  selected: false,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "Blue",
                  selected: true,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "Green",
                  selected: false,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "Blue",
                  selected: true,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "Green",
                  selected: false,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "Blue",
                  selected: true,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VSectionHeading(
              title: "Size",
              showActionButton: false,
            ),
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                VChoiceChip(
                  text: "EU 34",
                  selected: false,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "EU 36",
                  selected: true,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "EU 38",
                  selected: false,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "EU 34",
                  selected: false,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "EU 36",
                  selected: true,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "EU 38",
                  selected: false,
                  onSelected: (value) {},
                ),
                VChoiceChip(
                  text: "EU 38",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
      ],
    );
  }
}
