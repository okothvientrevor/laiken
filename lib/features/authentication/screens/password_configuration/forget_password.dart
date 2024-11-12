import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/login_signup/text_form_field.dart';
import 'package:store/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/helpers/helper_functions.dart';
import 'package:store/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: dark
              ? VColors.white
              : VColors.black, // Change this to your desired color
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              VTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: VSizes.spaceBtwItems,
            ),

            Text(
              VTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: VSizes.spaceBtwSections * 2,
            ),
            // Text field
            Form(
              key: controller.forgotPasswordFormKey,
              child: VTextFormField(
                  controller: controller.email,
                  validator: VValidator.validateEmail,
                  icon: const Icon(Iconsax.direct_right),
                  label: VTexts.email),
            ),
            const SizedBox(
              height: VSizes.spaceBtwSections,
            ),

            // Submit Button
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.sendPaswordResetEmail(),
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
          ],
        ),
      ),
    );
  }
}
