import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/bindings/general_bindings.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      theme: VAppTheme.lightTheme,
      darkTheme: VAppTheme.darkTheme,
      initialBinding: GeneralBindings(),

      // Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen
      home: const Scaffold(
        backgroundColor: VColors.primaryColor,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
