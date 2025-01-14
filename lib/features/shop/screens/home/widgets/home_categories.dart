import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:store/common/widgets/images/category_shimmer.dart';
import 'package:store/features/shop/controllers/category_controller.dart';
import 'package:store/features/shop/screens/sub_category/sub_categories.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VHomeCategories extends StatelessWidget {
  const VHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    final dark = VHelperFunctions.isDarkMode(context);
    return Obx(() {
      if (categoryController.isLoading.value) return const VCategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            "No Data Found!",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return VVerticalImageText(
              image: category.image,
              backgroundColor: dark ? VColors.black : VColors.white,
              title: category.name,
              onTap: () =>
                  Get.to(() => SubCategoriesScreen(category: category)),
            );
          },
        ),
      );
    });
  }
}
