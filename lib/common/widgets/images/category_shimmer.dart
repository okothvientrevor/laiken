import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:store/features/shop/screens/home/widgets/shimmer_effect.dart';
import 'package:store/utils/constants/sizes.dart';

class VCategoryShimmer extends StatelessWidget {
  const VCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                VShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55,
                ),
                SizedBox(
                  height: VSizes.spaceBtwItems / 2,
                ),

                // Text
                VShimmerEffect(width: 55, height: 8)
              ],
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
                width: VSizes.spaceBtwItems,
              ),
          itemCount: itemCount),
    );
  }
}
