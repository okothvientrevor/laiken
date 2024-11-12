import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/features/authentication/controllers/login/login_controller.dart';
import 'package:store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:store/features/authentication/screens/signup/signup.dart';
import 'package:store/navigation_menu.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/validators/validation.dart';

class VLoginForm extends StatelessWidget {
  const VLoginForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: VSizes.spaceBtwSections),
          child: Column(
            children: [
              // Email
              TextFormField(
                controller: controller.email,
                validator: (value) => VValidator.validateEmail(value),
                decoration: InputDecoration(
                  labelStyle:
                      TextStyle(color: dark ? VColors.light : VColors.dark),
                  prefixIcon: const Icon(Iconsax.direct_right),
                  labelText: VTexts.email,
                  floatingLabelStyle:
                      TextStyle(color: dark ? VColors.light : VColors.dark),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Colors.blue), // Border color on focus
                  ),
                ),
              ),
              const SizedBox(
                height: VSizes.spaceBetweenInputFields,
              ),

              // Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => VValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: VTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                    errorStyle: const TextStyle(color: Colors.red),
                    labelStyle:
                        TextStyle(color: dark ? VColors.light : VColors.dark),
                    floatingLabelStyle:
                        TextStyle(color: dark ? VColors.light : VColors.dark),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.blue), // Border color on focus
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: VSizes.spaceBetweenInputFields / 2,
              ),

              // Remember Me & Forgot Password

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remember Me
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      const Text(VTexts.rememberMe)
                    ],
                  ),
                  // Forgot Password
                  TextButton(
                    child: const Text(
                      VTexts.forgotPassword,
                      style: TextStyle(color: VColors.primaryColor),
                    ),
                    onPressed: () {
                      Get.to(() => const ForgetPassword());
                    },
                  )
                ],
              ),
              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),

              // Sign In Button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.emailAndPasswordSignIn(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue, // Background color of the button
                      disabledBackgroundColor:
                          Colors.blue, // Color when the button is disabled
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(VTexts.signIn),
                  ),
                ),
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),

              // Create Account Button
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {
                        Get.to(() => const SignupScreen());
                      },
                      child: Text(
                        VTexts.createAccount,
                        style: TextStyle(
                            color: dark ? VColors.light : VColors.dark),
                      ))),

              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),
            ],
          ),
        ));
  }
}
