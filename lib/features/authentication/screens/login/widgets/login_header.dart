import 'package:flutter/material.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';

class VLoginHeader extends StatelessWidget {
  const VLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: VSizes.imageThumbSize,
          child: Image(
            image: AssetImage(VImages.neutralLogo),
          ),
        ),
        const SizedBox(
          height: VSizes.sm,
        ),
        Text(
          VTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: VSizes.sm,
        ),
        Text(
          VTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
