import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/images/v_rounded_image.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/controllers/category_controller.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/common/widgets/products/product_cards/product_card_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  final CategoryModel category;

  const SubCategoriesScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();

    return Scaffold(
      appBar: VAppBar(
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              if (category.image.isNotEmpty)
                VRoundedImage(
                  imageUrl: category.image,
                  width: double.infinity,
                  applyImageRadius: true,
                ),
              const SizedBox(height: VSizes.spaceBtwSections),

              // Sub Categories
              Obx(() {
                final subCategories = categoryController.subCategories
                    .where((subCat) => subCat.parentId == category.id)
                    .toList();

                return Column(
                  children: subCategories.map((subCategory) {
                    return Column(
                      children: [
                        VSectionHeading(
                          title: subCategory.name,
                          onPressed: () {},
                        ),
                        const SizedBox(height: VSizes.spaceBtwItems / 2),
                        SizedBox(
                          height: 120,
                          child: ListView.separated(
                            itemCount:
                                4, // You might want to replace this with actual product count
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: VSizes.spaceBtwItems),
                            itemBuilder: (context, index) =>
                                const VProductCardHorizontal(),
                          ),
                        ),
                        const SizedBox(height: VSizes.spaceBtwSections),
                      ],
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
