import 'package:flutter/material.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/utils/constants/sizes.dart';

class VBillingAddressSection extends StatelessWidget {
  const VBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSectionHeading(
          title: "Delivery Address",
          buttonTitle: "Change",
          onPressed: () {},
        ),
        Text("Mwanje Farouq", style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(
              width: VSizes.spaceBtwItems / 2,
            ),
            Text("0776 000 651", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(
              width: VSizes.spaceBtwItems / 2,
            ),
            Text(
              "Clement Hill ROad",
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        )
      ],
    );
  }
}
