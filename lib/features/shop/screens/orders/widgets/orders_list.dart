import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VOrderListItems extends StatelessWidget {
  const VOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(
        height: VSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) => VRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(VSizes.md),
        backgroundColor: dark ? VColors.dark : VColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row 1
            Row(
              children: [
                // Icon
                Icon(
                  Iconsax.ship,
                  color: dark ? VColors.light : VColors.dark,
                ),
                const SizedBox(
                  width: VSizes.spaceBtwItems / 2,
                ),

                // Status and Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: VColors.primaryColor, fontWeightDelta: 1),
                      ),
                      Text("07 Nov 2024",
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                // Icon Button
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_34,
                      size: VSizes.iconSm,
                    ))
              ],
            ),

            const SizedBox(height: VSizes.spaceBtwItems / 2),

            // Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Icon
                      Icon(
                        Iconsax.ship,
                        color: dark ? VColors.light : VColors.dark,
                      ),
                      const SizedBox(
                        width: VSizes.spaceBtwItems / 2,
                      ),

                      // Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order",
                                style: Theme.of(context).textTheme.labelMedium),
                            Text("[#256f3]",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      // Icon
                      Icon(
                        Iconsax.calendar,
                        color: dark ? VColors.light : VColors.dark,
                      ),
                      const SizedBox(
                        width: VSizes.spaceBtwItems / 2,
                      ),

                      // Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shipping Date",
                                style: Theme.of(context).textTheme.labelMedium),
                            Text("03 December 2024",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
