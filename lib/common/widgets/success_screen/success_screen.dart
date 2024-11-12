import 'package:flutter/material.dart';
import 'package:store/common/styles/spacing_styles.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: VSpacingStyle.paddingWithAppbarHeight,
        child: Column(
          children: [
            const SizedBox(
              height: VSizes.spaceBtwSections,
            ),
            // Image
            Image(
              image: AssetImage(image),
              width: VHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(
              height: VSizes.spaceBtwSections,
            ),

            // Title & SubTitle
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: VSizes.spaceBtwItems,
            ),

            Text(
              subTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: VSizes.spaceBtwSections,
            ),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onPressed, child: const Text("Continue")),
            ),
          ],
        ),
      ),
    );
  }
}
