import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store/data/repositories/user/user_repository.dart';
import 'package:store/data/services/network_manager.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/features/personalization/screens/profile/profile.dart';
import 'package:store/utils/constants/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // Init user data when Home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // Loading state
  final isLoading = false.obs;

  // Fetch User record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
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
      if (!updateUserNameFormKey.currentState!.validate()) {
        // Remove Loader
        isLoading.value = false;
        // VFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first and last name in Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      //  Update the Rx User Value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      isLoading.value = false;
      // VFullScreenLoader.stopLoading();

      // Show success message
      VLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your name has been updated');

      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Remove Loader
      isLoading.value = false;
      // VFullScreenLoader.stopLoading();

      // Show some generic error to the user
      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
