import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/res/CommonWidgets/CustomButton/custom_button.dart';

import '../../View/ForgetBottomSheet/forget_bottom_sheet.dart';
import '../../res/CommonWidgets/AppText/app_text.dart';
import '../../res/CommonWidgets/CustomTextFormField/custom_text_form_field.dart';

class LoginController extends GetxController {
  RxBool obscureText = true.obs;
  RxBool isChecked = false.obs;

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void check() {
    isChecked.value = !isChecked.value;
  }

  void showForgetPasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: ForgetPasswordBottomSheet(),
        );
      },
    );
  }

}
