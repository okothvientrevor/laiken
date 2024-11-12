import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/device/device_utility.dart';

class VTabBar extends StatelessWidget implements PreferredSizeWidget {
  const VTabBar({
    super.key,
    required this.dark,
    required this.tabs,
  });

  final bool dark;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: dark ? VColors.black : VColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: VColors.primaryColor,
          unselectedLabelColor: dark ? VColors.white : VColors.darkerGrey,
          labelColor: VColors.primaryColor,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(VDeviceUtils.getAppBarHeight());
}
