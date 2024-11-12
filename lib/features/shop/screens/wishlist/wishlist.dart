import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/icons/v_circular_icon.dart';
import 'package:store/common/widgets/layouts/grid_layout.dart';
import 'package:store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:store/features/shop/screens/home/home.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: VAppBar(
        title: Text(
          "Wishlist",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(fontSizeDelta: 1.5),
        ),
        actions: [
          VCircularIcon(
            icon: Iconsax.add,
            dark: dark,
            onPressed: () => Get.to(() => HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              VGridLayout(
                  itemCount: 6,
                  itemBuider: (_, index) => const VProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
