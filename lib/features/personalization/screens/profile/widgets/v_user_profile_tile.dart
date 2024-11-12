import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/images/v_circular_image.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VUserProfileTile extends StatelessWidget {
  const VUserProfileTile(
      {super.key, required this.onPressed, required bool dark});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final dark = VHelperFunctions.isDarkMode(context);
    return ListTile(
      leading: VCircularImage(
        dark: dark,
        image: VImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: VColors.white)),
      subtitle: Text(controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: VColors.white)),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: VColors.white,
        ),
      ),
    );
  }
}
