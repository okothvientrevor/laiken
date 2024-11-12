import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:store/common/widgets/brands/brand_card.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class VBrandShowcase extends StatelessWidget {
  const VBrandShowcase({
    super.key,
    required this.dark,
    required this.images,
  });

  final bool dark;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return VRoundedContainer(
      showBorder: true,
      borderColor: VColors.grey,
      padding: const EdgeInsets.all(VSizes.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: VSizes.spaceBtwItems),
      child: Column(
        children: [
          // Brand with Product counts
          const VBrandCard(
            showBorder: false,
          ),

          // Brand top 3 products
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList())
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: VRoundedContainer(
        height: 100,
        backgroundColor: dark ? VColors.darkerGrey : VColors.light,
        margin: const EdgeInsets.only(right: VSizes.sm),
        padding: const EdgeInsets.all(VSizes.md),
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
