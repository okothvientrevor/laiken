import 'package:flutter/material.dart';
import 'package:store/common/widgets/images/v_rounded_image.dart';
import 'package:store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:store/common/widgets/texts/product_title_text.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class VCartItem extends StatelessWidget {
  const VCartItem({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image

        VRoundedImage(
          imageUrl: VImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(VSizes.sm),
          backgroundColor: dark ? VColors.darkerGrey : VColors.light,
        ),
        const SizedBox(
          width: VSizes.spaceBtwItems,
        ),

        // Title, Price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VBrandTitleTextWithVerifiedIcon(title: "Nike"),
              const Flexible(
                child: VProductTitleText(
                  title: "Black Sports shoes",
                  maxLines: 1,
                ),
              ),

              // Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Color: ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: "Green",
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: "Size: ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: "UK 08",
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
