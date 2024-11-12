import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/images/shimmer_effect.dart';
import 'package:store/common/widgets/images/v_circular_image.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:store/features/personalization/screens/profile/widgets/v_user_profile_tile.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final dark = VHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const VAppBar(
        title: Text("Profile"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              // Profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : VImages.user;

                      return controller.imageUploading.value
                          ? VShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : VCircularImage(
                              dark: dark,
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              // VUserProfileTile(
              //   dark: dark,
              //   onPressed: () {},
              // ),

              const SizedBox(
                height: VSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: VSizes.spaceBtwItems / 2,
              ),

              // Heading Profile Info
              const VSectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems / 2,
              ),

              VProfileMenu(
                title: "Name",
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              VProfileMenu(
                title: "Username",
                value: controller.user.value.username,
                onPressed: () {},
              ),

              const SizedBox(
                height: VSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: VSizes.spaceBtwItems / 2,
              ),

              // Heading personal info
              const VSectionHeading(
                title: "Personal Information",
                showActionButton: false,
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems / 2,
              ),

              VProfileMenu(
                title: "User ID",
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              VProfileMenu(
                title: "Email",
                value: controller.user.value.email,
                onPressed: () {},
              ),
              VProfileMenu(
                title: "Phone Number",
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              VProfileMenu(
                title: "Gender",
                value: "Male",
                onPressed: () {},
              ),
              VProfileMenu(
                title: "Date of Birth",
                value: "10th Oct, 1964",
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: VSizes.spaceBtwItems / 2,
              ),

              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      "Delete account",
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
