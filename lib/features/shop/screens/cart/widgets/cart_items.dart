import 'package:flutter/material.dart';
import 'package:store/common/widgets/products/cart/add_remove_button.dart';
import 'package:store/common/widgets/products/cart/cart_item.dart';
import 'package:store/common/widgets/products/product_cards/product_price_text.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VCartItems extends StatelessWidget {
  const VCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);

    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(
              height: VSizes.spaceBtwSections,
            ),
        itemCount: 2,
        itemBuilder: (_, index) => Column(
              children: [
                // Cart Item
                VCartItem(dark: dark),
                if (showAddRemoveButtons)
                  const SizedBox(
                    height: VSizes.spaceBtwItems,
                  ),

                // Add or Remove items with total price
                if (showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Extra space for the image container
                          const SizedBox(
                            width: 70,
                          ),
                          // Add and Remove buttons
                          VProductQuantityWithAddAndRemove(dark: dark),
                        ],
                      ),

                      // Product total price
                      const VProductPriceText(price: "260,000")
                    ],
                  )
              ],
            ));
  }
}
