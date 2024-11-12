import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/repositories/authentication/authentication_repository.dart';
import 'package:store/features/authentication/controllers/login/login_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class VSocialButtons extends StatelessWidget {
  const VSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: VColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: const Image(
              image: AssetImage(VImages.google),
              width: VSizes.iconMd,
              height: VSizes.iconMd,
            ),
            onPressed: () => controller.googleSignIn(),
          ),
        ),
        const SizedBox(
          width: VSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: VColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: const Image(
              image: AssetImage(VImages.facebook),
              width: VSizes.iconMd,
              height: VSizes.iconMd,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
