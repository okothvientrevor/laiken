import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VCouponCode extends StatelessWidget {
  const VCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return VRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? VColors.dark : VColors.light,
      padding: const EdgeInsets.only(
          top: VSizes.sm, bottom: VSizes.sm, right: VSizes.sm, left: VSizes.md),
      child: Row(
        children: [
          // TextField
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Have a promo code? Enter here",
                hintStyle: Theme.of(context).textTheme.bodySmall,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          // Button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: dark
                          ? VColors.white.withOpacity(0.5)
                          : VColors.dark.withOpacity(0.5),
                      backgroundColor: VColors.grey.withOpacity(0.5),
                      side: BorderSide(color: VColors.grey.withOpacity(0.5))),
                  child: const Text("Apply")))
        ],
      ),
    );
  }
}
