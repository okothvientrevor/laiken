import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/login_signup/text_form_field.dart';
import 'package:store/common/widgets/login_signup/terms_conditions_checkbox.dart';
import 'package:store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/helpers/helper_functions.dart';
import 'package:store/utils/validators/validation.dart';

class VSignupForm extends StatelessWidget {
  const VSignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: VTextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      VValidator.validateEmptyText("First name", value),
                  icon: const Icon(Iconsax.user),
                  label: VTexts.firstName,
                ),
              ),
              const SizedBox(
                width: VSizes.spaceBetweenInputFields,
              ),
              Expanded(
                child: VTextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      VValidator.validateEmptyText("Last name", value),
                  icon: const Icon(Iconsax.user),
                  label: VTexts.lastName,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: VSizes.spaceBetweenInputFields,
          ),

          // Username
          VTextFormField(
            controller: controller.username,
            validator: (value) =>
                VValidator.validateEmptyText("Username", value),
            icon: const Icon(Iconsax.user_edit),
            label: VTexts.username,
          ),
          const SizedBox(
            height: VSizes.spaceBetweenInputFields,
          ),

          // Email
          VTextFormField(
            controller: controller.email,
            validator: (value) => VValidator.validateEmail(value),
            icon: const Icon(Iconsax.direct),
            label: VTexts.email,
          ),
          const SizedBox(
            height: VSizes.spaceBetweenInputFields,
          ),

          // Phone Number
          VTextFormField(
            controller: controller.phoneNumber,
            validator: (value) => VValidator.validatePhoneNumber(value),
            icon: const Icon(Iconsax.call),
            label: VTexts.phoneNo,
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
            height: VSizes.spaceBetweenInputFields,
          ),

          // Terms & Conditions checkbox
          VTermsAndConditionsCheckBox(),
          const SizedBox(
            height: VSizes.spaceBtwSections,
          ),

          // Sign Up Button
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () => controller.signup(),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Background color of the button
                  disabledBackgroundColor:
                      Colors.blue, // Color when the button is disabled
                ),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Text(VTexts.createAccount),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
