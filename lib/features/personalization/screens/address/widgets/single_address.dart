import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VSingleAddress extends StatelessWidget {
  const VSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return VRoundedContainer(
      padding: const EdgeInsets.all(VSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? VColors.primaryColor.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? VColors.darkerGrey
              : VColors.grey,
      margin: const EdgeInsets.only(bottom: VSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? dark
                        ? VColors.light
                        : VColors.dark
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Farouq Mwanje",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: VSizes.sm / 2,
              ),
              const Text(
                "0776 000 651",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: VSizes.sm / 2,
              ),
              const Text(
                "Plot 8, Clement Hill Road, Nakasero",
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
