import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/data/repositories/authentication/authentication_repository.dart';
import 'package:store/data/services/network_manager.dart';
import 'package:store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:store/utils/constants/loaders.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

// Loading state
  final isLoading = false.obs;

// Send Reset Password email
  sendPaswordResetEmail() async {
    try {
      // Start the loader
      isLoading.value = true;

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        isLoading.value = false;
        // VFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        isLoading.value = false;
        // VFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      isLoading.value = false;

      // Show success screen
      VLoaders.successSnackBar(
          title: 'Email Sent',
          message: "Email link sent to reset your password".tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
// Remove Loader
      isLoading.value = false;

      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPaswordResetEmail(String email) async {
    try {
      // Start the loader
      isLoading.value = true;

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        isLoading.value = false;
        // VFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      isLoading.value = false;

      // Show success screen
      VLoaders.successSnackBar(
          title: 'Email Sent',
          message: "Email link sent to reset your password".tr);
    } catch (e) {
// Remove Loader
      isLoading.value = false;

      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
