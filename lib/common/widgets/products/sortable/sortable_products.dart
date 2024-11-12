import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/layouts/grid_layout.dart';
import 'package:store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:store/utils/constants/sizes.dart';

class VSortableProducts extends StatelessWidget {
  const VSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown

        DropdownButtonFormField(
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
              // hintText: 'Select an option',
              // hintStyle: Theme.of(context).textTheme.bodyLarge,
            ),
            items: [
              "Name",
              "Higher Price",
              "Lower Price",
              "Sale",
              "Newest",
              "Popularity"
            ]
                .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            onChanged: (value) {}),

        const SizedBox(
          height: VSizes.spaceBtwSections,
        ),

        VGridLayout(
            itemCount: 4,
            itemBuider: (_, index) => const VProductCardVertical())
      ],
    );
  }
}
