import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:store/features/shop/screens/checkout/checkout.dart';

import 'package:store/utils/constants/sizes.dart';
// import 'package:store/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: VAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(VSizes.defaultSpace),

        // Items in the Cart
        child: VCartItems(),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
              left: VSizes.defaultSpace,
              right: VSizes.defaultSpace,
              bottom: VSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () => Get.to(() => const CheckoutScreen()),
              child: const Text("Checkout 260,000"))),
    );
  }
}
