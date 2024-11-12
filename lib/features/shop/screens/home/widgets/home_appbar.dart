import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/features/shop/screens/home/widgets/shimmer_effect.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/text_strings.dart';

class VHomeAppBar extends StatelessWidget {
  const VHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return VAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            VTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: VColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a shimmer loader while user profile is being loaded
              return const VShimmerEffect(
                width: 80,
                height: 15,
              );
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: VColors.white),
              );
            }
          }),
        ],
      ),
      actions: [
        VCartCounterIcon(
          onPressed: () {},
          iconColor: VColors.white,
        )
      ],
    );
  }
}
