import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:store/common/widgets/images/v_circular_image.dart';
import 'package:store/common/widgets/texts/brand_title_text.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VBrandCard extends StatelessWidget {
  const VBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: VRoundedContainer(
        padding: const EdgeInsets.all(VSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Icon
            Flexible(
              child: VCircularImage(
                dark: dark,
                isNetworkImage: false,
                image: VImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? VColors.white : VColors.black,
              ),
            ),
            const SizedBox(
              height: VSizes.spaceBtwItems / 2,
            ),

            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      VBrandTitleText(
                        title: "Nike",
                        brandTextSizes: TextSizes.large,
                      ),
                      SizedBox(
                        width: VSizes.sm / 4,
                      ),
                      Icon(
                        Iconsax.verify5,
                        color: VColors.primaryColor,
                        size: VSizes.iconXs,
                      )
                    ],
                  ),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
