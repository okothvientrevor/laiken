import 'package:flutter/material.dart';
import 'package:store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';

class OnboardingCircularButton extends StatelessWidget {
  const OnboardingCircularButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final dark = VHelperFunctions.isDarkMode(context);
    return Positioned(
        right: VSizes.defaultSpace,
        bottom: VDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: VColors.primaryColor),
            onPressed: () => OnBoardingController.instance.nextPage(),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )));
  }
}
