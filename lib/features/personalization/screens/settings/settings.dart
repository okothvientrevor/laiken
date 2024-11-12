import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:store/common/widgets/layouts/list_tiles/settings_menu_tile.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/data/repositories/authentication/authentication_repository.dart';
import 'package:store/features/card/screens/barcode_scanning.dart';
import 'package:store/features/personalization/screens/address/address.dart';
import 'package:store/features/personalization/screens/profile/profile.dart';
import 'package:store/features/personalization/screens/profile/widgets/v_user_profile_tile.dart';

import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            VPrimaryHeaderContainer(
                child: Column(
              children: [
                // Appbar
                VAppBar(
                  title: Text(
                    "Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: VColors.white),
                  ),
                ),
                // User profile card
                VUserProfileTile(
                  onPressed: () => Get.to(() => const ProfileScreen()),
                  dark: dark,
                ),

                // ListTile(),
                const SizedBox(
                  height: VSizes.spaceBtwSections,
                )
              ],
            )),

            // body
            Padding(
              padding: const EdgeInsets.all(VSizes.defaultSpace),
              child: Column(
                children: [
                  // heading
                  const VSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: VSizes.spaceBtwItems,
                  ),

                  // Sttings List items

                  // VSettingsMenuTile(
                  //   icon: Iconsax.safe_home,
                  //   title: 'My Address',
                  //   subtitle:
                  //       'Save your residential address for easier location sharing',
                  //   onTap: () => Get.to(() => const UserAddressScreen()),
                  // ),
                  // VSettingsMenuTile(
                  //   icon: Iconsax.shopping_cart,
                  //   title: 'My Cart',
                  //   subtitle: 'Add, remove products and proceed to checkout',
                  //   onTap: () {},
                  // ),
                  // VSettingsMenuTile(
                  //   icon: Iconsax.bag_tick,
                  //   title: 'My Orders',
                  //   subtitle: 'In-progress and completed orders',
                  //   onTap: () {},
                  // ),
                  // VSettingsMenuTile(
                  //   icon: Iconsax.bank,
                  //   title: 'Bank Account',
                  //   subtitle: 'Save bank account details',
                  //   onTap: () {},
                  // ),
                  VSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'List of all the discounted coupons',
                    onTap: () {},
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.scan_barcode,
                    title: 'Scan Barcode',
                    subtitle: 'Scan a barcode to reveal card details',
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return BarcodeScanPage();
                      }));
                    },
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage usage and connected accounts',
                    onTap: () {},
                  ),

                  // App Settings
                  // const SizedBox(
                  //   height: VSizes.spaceBtwSections,
                  // ),
                  // const VSectionHeading(
                  //   title: "App Settings",
                  //   showActionButton: false,
                  // ),
                  // const SizedBox(
                  //   height: VSizes.spaceBtwItems,
                  // ),
                  // VSettingsMenuTile(
                  //   icon: Iconsax.document_upload,
                  //   title: 'Load data',
                  //   subtitle: 'Upload data to your cloud firebase',
                  //   onTap: () {},
                  // ),
                  // VSettingsMenuTile(
                  //   icon: Iconsax.location,
                  //   title: 'Geolocation',
                  //   subtitle: 'Set recommendation based on location',
                  //   trailing: Switch(value: true, onChanged: (value) {}),
                  // ),
                  // VSettingsMenuTile(
                  //   icon: Iconsax.security_user,
                  //   title: 'Safe Mode',
                  //   subtitle: 'Search result is safe for all ages',
                  //   trailing: Switch(value: false, onChanged: (value) {}),
                  // ),
                  // VSettingsMenuTile(
                  //   icon: Iconsax.image,
                  //   title: 'HD Image Quality',
                  //   subtitle: 'Set image quality to be seen',
                  //   trailing: Switch(value: false, onChanged: (value) {}),
                  // ),

                  // Logout Button
                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        child: Text(
                          "Logout",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                  ),
                  const SizedBox(
                    height: VSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
