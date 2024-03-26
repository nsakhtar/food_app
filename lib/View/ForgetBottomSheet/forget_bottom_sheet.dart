import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/res/AppAssets/app_assets.dart';
import '../../res/CommonWidgets/AppText/app_text.dart';
import '../../res/CommonWidgets/CustomButton/custom_button.dart';
import '../../res/CommonWidgets/CustomTextFormField/custom_text_form_field.dart';
import '../../res/routes/route_name.dart';

class ForgetPasswordBottomSheet extends StatefulWidget {
  const ForgetPasswordBottomSheet({Key? key}) : super(key: key);

  @override
  _ForgetPasswordBottomSheetState createState() =>
      _ForgetPasswordBottomSheetState();
}

class _ForgetPasswordBottomSheetState extends State<ForgetPasswordBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isTablet = size.width >= 600;

    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Image.asset(AppAssets.resetPassword),
                  AppText(
                    text: 'Forget Password',
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    labelText: 'Email',
                    hintText: 'Enter your email ID',
                    prefixIcon: Icons.email_outlined,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!GetUtils.isEmail(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        String email = _emailController.text;
                        print('Email: $email');
                        Get.snackbar('Reset Password', 'Password reset instructions sent to $email',
                            duration: Duration(seconds: 3),);
                        Navigator.pop(context);
                      }
                    },
                    label: 'Reset Password',
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
