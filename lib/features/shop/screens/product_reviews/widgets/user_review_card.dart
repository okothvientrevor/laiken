import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(VImages.userProfileImage3),
                ),
                const SizedBox(
                  width: VSizes.spaceBtwItems,
                ),
                Text(
                  "Mike Kaihura",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),

        // Review
        Row(
          children: [
            const VRatingBarIndicator(rating: 4),
            const SizedBox(
              width: VSizes.spaceBtwItems,
            ),
            Text(
              "28 Jun, 2024",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems,
        ),

        const ReadMoreText(
          "The user interface of this app is quite beautiful. I was able to navigate and make orders seamlessly. Great Job!",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: " show less",
          trimCollapsedText: " show more",
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: VColors.primaryColor),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: VColors.primaryColor),
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),

        // Company Review
        VRoundedContainer(
          backgroundColor: dark ? VColors.darkerGrey : VColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(VSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nike store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "28 Jun, 2024",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: VSizes.spaceBtwItems / 2,
                ),
                const ReadMoreText(
                  "The user interface of this app is quite beautiful. I was able to navigate and make orders seamlessly. Great Job!",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " show less",
                  trimCollapsedText: " show more",
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: VColors.primaryColor),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: VColors.primaryColor),
                )
              ],
            ),
          ),
        ),

        const SizedBox(
          height: VSizes.spaceBtwItems,
        ),
        const Divider(),
      ],
    );
  }
}
