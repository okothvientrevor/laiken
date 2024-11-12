import 'package:flutter/material.dart';
import 'package:store/utils/constants/sizes.dart';

class VBillingAmountSection extends StatelessWidget {
  const VBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtotal

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal: ", style: Theme.of(context).textTheme.bodyMedium),
            Text("Ush 260,000", style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),

        const SizedBox(
          height: VSizes.spaceBtwItems / 4,
        ),

        // Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee: ",
                style: Theme.of(context).textTheme.bodyMedium),
            Text("Ush 20,000", style: Theme.of(context).textTheme.labelLarge)
          ],
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 4,
        ),

        // Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee: ", style: Theme.of(context).textTheme.bodyMedium),
            Text("Ush 2,000", style: Theme.of(context).textTheme.labelLarge)
          ],
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 4,
        ),

        // Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order total: ",
                style: Theme.of(context).textTheme.bodyMedium),
            Text("Ush 264,000", style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ],
    );
  }
}
