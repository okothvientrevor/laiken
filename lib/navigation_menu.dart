import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/features/personalization/screens/settings/settings.dart';
import 'package:store/features/shop/screens/home/home.dart';
import 'package:store/features/shop/screens/store/offers_screen.dart';
import 'package:store/features/shop/screens/store/widgets/settings_screen2.dart';
import 'package:store/features/shop/screens/wishlist/wishlist.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = VHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle:
                WidgetStateProperty.resolveWith<TextStyle?>((states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(color: VColors.white); // Selected label color
              }
              return const TextStyle(
                  color: Colors.grey); // Unselected label color
            }),
          ),
          child: NavigationBar(
            height: 52,
            elevation: 0,
            backgroundColor: dark ? VColors.black : VColors.black,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.cards), label: "Cards"),
              NavigationDestination(icon: Icon(Iconsax.tag), label: "Offers"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    const OffersScreen(),
    // const SettingsScreen()
    SettingsScreen2()
  ];
}
