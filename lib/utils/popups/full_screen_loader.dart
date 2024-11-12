// A Utility class for managing a full-screen loading dialog
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/loaders/animation_loader.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VFullScreenLoader {
  // Open a full screen loading dialog with a given text and animation
  //  This method doesnt return anything
  //
  // Parameters:
  //   - text: The text to be displayed in the loading dialog
  //   - animation: The Lottie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context:
            Get.overlayContext!, //Use Get.overlayContext for  overlay dialogs
        barrierDismissible:
            false, // The dialog cant be dismissed by tapping outside
        builder: (_) => PopScope(
            canPop: false, //Disable popping with the back button
            child: Container(
              color: VHelperFunctions.isDarkMode(Get.context!)
                  ? VColors.black
                  : VColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  VAnimationLoaderWidget(
                    animation: animation,
                    text: text,
                  )
                ],
              ),
            )));
  }

  // Stop the currently open loading dialog
  // This method doesnt return anything

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); //Close the dialog using navigator
  }
}
