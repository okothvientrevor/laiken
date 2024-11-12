import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/repositories/authentication/authentication_repository.dart';
import 'package:store/data/repositories/user/user_repository.dart';
import 'package:store/data/services/network_manager.dart';
import 'package:store/features/authentication/models/user_model.dart';
import 'package:store/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/loaders.dart';
import 'package:store/utils/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

// Variables
  final hidePassword = true.obs; //Observable for hiding/showing password
  final privacyPolicy = true.obs; //Observable for privacy policy aceptance
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for user name input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber = TextEditingController(); // Controller for number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Loading state
  final isLoading = false.obs;

// SignUp

  void signup() async {
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
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        isLoading.value = false;
        // VFullScreenLoader.stopLoading();
        return;
      }

      // Privacy policy check
      if (!privacyPolicy.value) {
        VLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                'In order to create account, you have to read and accept the Privacy Policy & Terms of Use');

        return;
      }

      // Register user in the Firebase Authentication & save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      isLoading.value = false;
      // VFullScreenLoader.stopLoading();

      // Show Success message
      VLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      // Move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      isLoading.value = false;
      // VFullScreenLoader.stopLoading();

      // Show some generic error to the user
      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
