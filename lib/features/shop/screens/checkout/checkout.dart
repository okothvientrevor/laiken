// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:store/common/widgets/products/cart/coupon_widget.dart';
import 'package:store/common/widgets/success_screen/success_screen.dart';
import 'package:store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:store/navigation_menu.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: VAppBar(
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              // Items in cart
              VCartItems(
                showAddRemoveButtons: false,
              ),
              SizedBox(
                height: VSizes.spaceBtwSections,
              ),

              // Coupon TextField
              VCouponCode(),
              SizedBox(
                height: VSizes.spaceBtwSections,
              ),

              // Billing Section
              VRoundedContainer(
                padding: EdgeInsets.all(VSizes.md),
                showBorder: true,
                backgroundColor: dark ? VColors.dark : VColors.white,
                child: Column(
                  children: [
                    // Pricing
                    VBillingAmountSection(),
                    SizedBox(
                      height: VSizes.spaceBtwItems,
                    ),

                    // Divider
                    Divider(),

                    // Payment Methods
                    VBillingPaymentSection(),
                    SizedBox(
                      height: VSizes.spaceBtwItems,
                    ),

                    // Address
                    VBillingAddressSection(),
                    SizedBox(
                      height: VSizes.spaceBtwItems,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: VSizes.defaultSpace,
              right: VSizes.defaultSpace,
              bottom: VSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () => Get.to(() => SuccessScreen(
                    image: VImages.successfulPaymentIcon,
                    title: "Payment Success",
                    subTitle: "Your item will be delivered soon",
                    onPressed: () => Get.offAll(() => NavigationMenu()),
                  )),
              child: Text("Checkout 260,000"))),
    );
  }
}
