import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/login_signup/form_divider.dart';
import 'package:store/common/widgets/login_signup/social_buttons.dart';
import 'package:store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                VTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),

              // Form
              VSignupForm(dark: dark),
              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),

              // Divider
              VFormDivider(
                  dark: dark, dividerText: VTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),

              // Social Buttons

              const VSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
