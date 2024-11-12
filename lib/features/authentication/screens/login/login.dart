import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/styles/spacing_styles.dart';
import 'package:store/common/widgets/login_signup/form_divider.dart';
import 'package:store/common/widgets/login_signup/social_buttons.dart';
import 'package:store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';

import 'package:store/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: VSpacingStyle.paddingWithAppbarHeight,
        child: Column(
          children: [
            // Logo title and subtitle
            const VLoginHeader(),

            // Form
            VLoginForm(dark: dark),

            // Divider
            VFormDivider(
              dark: dark,
              dividerText: VTexts.orSignInWith.capitalize!,
            ),
            const SizedBox(
              height: VSizes.spaceBtwItems,
            ),
            // // Footer
            const VSocialButtons()
          ],
        ),
      ),
    ));
  }
}
