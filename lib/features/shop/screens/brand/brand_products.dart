import 'package:flutter/material.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/brands/brand_card.dart';
import 'package:store/common/widgets/products/sortable/sortable_products.dart';
import 'package:store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: VAppBar(
        title: Text(
          "Nike",
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              // Brand Detail
              VBrandCard(showBorder: true),
              SizedBox(
                height: VSizes.spaceBtwSections,
              ),

              VSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
