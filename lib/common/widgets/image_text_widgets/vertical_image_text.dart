import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VVerticalImageText extends StatelessWidget {
  const VVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = VColors.white,
    this.backgroundColor = VColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: VSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(VSizes.sm),
              decoration: BoxDecoration(
                  color:
                      backgroundColor ?? (dark ? VColors.black : VColors.white),
                  borderRadius: BorderRadius.circular(56)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: dark ? VColors.white : VColors.black,
                ),
              ),
            ),
            const SizedBox(
              height: VSizes.spaceBtwItems / 3,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
