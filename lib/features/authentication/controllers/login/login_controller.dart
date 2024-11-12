import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store/data/repositories/authentication/authentication_repository.dart';
import 'package:store/data/services/network_manager.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/utils/constants/loaders.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Loading state
  final isLoading = false.obs;

  // Email and Password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      isLoading.value = true;
      // VFullScreenLoader.openLoadingDialog(
      //     'We are processing your information ...', VImages.onBoardingImage2);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // Remove Loader
        isLoading.value = false;
        // VFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        isLoading.value = false;
        // VFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Login user using EMail & Password Authentication
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      isLoading.value = false;
      // VFullScreenLoader.stopLoading();

      // Redirect to home screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      isLoading.value = false;
      // VFullScreenLoader.stopLoading();

      // Show some generic error to the user
      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start loading
      isLoading.value = true;

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        VLoaders.errorSnackBar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection and try again.');
        return;
      }

      // Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // If userCredentials is null, it means the sign-in was canceled by the user
      if (userCredentials == null) {
        isLoading.value = false;
        VLoaders.warningSnackBar(
            title: 'Sign-In Canceled',
            message: 'You canceled the Google sign-in process.');
        return;
      }

      // Save userRecord
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      isLoading.value = false;

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      isLoading.value = false;

      if (e.toString().contains('PlatformException')) {
        VLoaders.errorSnackBar(
            title: 'Sign-In Failed',
            message:
                'There was an issue with Google Sign-In. Please try again or use another sign-in method.');
        print('Detailed error: $e'); // For debugging purposes
      } else {
        VLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      }
    }
  }
}
