import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:store/common/widgets/icons/v_circular_icon.dart';
import 'package:store/common/widgets/images/v_rounded_image.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VProductImageSlider extends StatelessWidget {
  const VProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return VCurvedEdgeWidget(
      child: Container(
        color: dark ? VColors.darkerGrey : VColors.light,
        child: Stack(
          children: [
            // Main large image
            const SizedBox(
                height: 300,
                child: Padding(
                  padding: EdgeInsets.all(VSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(image: AssetImage(VImages.productImage5))),
                )),

            // Image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: VSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemBuilder: (_, index) => VRoundedImage(
                      width: 80,
                      backgroundColor: dark ? VColors.dark : VColors.light,
                      border: Border.all(color: VColors.primaryColor),
                      padding: const EdgeInsets.all(VSizes.sm),
                      imageUrl: VImages.productImage3),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: VSizes.spaceBtwItems - 5,
                  ),
                  itemCount: 8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                ),
              ),
            ),

            // AppBar Icons
            VAppBar(
              showBackArrow: true,
              actions: [
                VCircularIcon(
                  dark: dark,
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
