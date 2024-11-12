import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VBillingPaymentSection extends StatelessWidget {
  const VBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        VSectionHeading(
          title: "Payment Method",
          buttonTitle: "Change",
          onPressed: () {},
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 4,
        ),
        Row(
          children: [
            VRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? VColors.light : VColors.white,
              padding: const EdgeInsets.all(VSizes.sm),
              child: const Image(
                image: AssetImage(VImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: VSizes.spaceBtwItems / 2,
            ),
            Text("Paypal", style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
