import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/helpers/helper_functions.dart';

class VTermsAndConditionsCheckBox extends StatelessWidget {
  const VTermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    final controller = SignUpController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
                value: controller.privacyPolicy.value,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value),
          ),
        ),
        const SizedBox(
          width: VSizes.spaceBetweenInputFields,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: VTexts.iAgreeto,
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: VTexts.privacyPolicy,
              style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: dark ? VColors.white : VColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      dark ? VColors.white : VColors.primaryColor)),
          TextSpan(
              text: ' ${VTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${VTexts.termsOfUse} ',
              style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: dark ? VColors.white : VColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      dark ? VColors.white : VColors.primaryColor)),
        ]))
      ],
    );
  }
}
