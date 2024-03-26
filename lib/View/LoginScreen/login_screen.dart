import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';
import '../../Controllers/LoginController/login_controller.dart';
import '../../res/AppAssets/app_assets.dart';
import '../../res/AppColors/app_colors.dart';
import '../../res/CommonWidgets/AppText/app_text.dart';
import '../../res/CommonWidgets/CustomButton/custom_button.dart';
import '../../res/CommonWidgets/CustomTextFormField/custom_text_form_field.dart';
import '../../res/routes/route_name.dart';
import 'Widget/IconButton/icon_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = true;


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isTablet = size.width >= 600;
    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isTablet ? 30 : 20, vertical: 10),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.login,
                    width: size.width * 0.7,
                    height: size.height * 0.27,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: 'Welcome Back!',
                      fontWeight: FontWeight.w600,
                      fontSize: isTablet ? 20 : 14,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  CustomTextFormField(
                    labelText: 'Email',
                    hintText: 'Enter your email ID',
                    prefixIcon: Icons.email_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  Obx(
                        () => CustomTextFormField(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: loginController.obscureText.value ? Icons.visibility : Icons.visibility_off,
                      obscureText: loginController.obscureText.value,
                      onTap: loginController.togglePasswordVisibility,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },

                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Row(
                    children: [
                      Obx(
                            () => GestureDetector(
                          onTap: () {
                            loginController.check();
                          },
                          child: Container(
                            width: isTablet?size.width * 0.03: size.width * 0.036,
                            height: isTablet?size.height * 0.027:size.height * 0.017,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: Colors.black),
                              color: loginController.isChecked.value
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                            ),
                            child: loginController.isChecked.value
                                ? Icon(
                              Icons.check,
                              color: Colors.white,
                              size: size.height * 0.013,
                            )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      AppText(text: 'Remember me', fontSize: isTablet?20:12),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => loginController.showForgetPasswordBottomSheet(context),
                        child: AppText(
                          text: 'Forget password?',
                          fontSize: isTablet ? 20 : 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.04),
                  CustomButton(
                    textColor: Colors.white,
                    label: isLoading?'Log in':'Loading...',
                    fontSize: isTablet ? 22 : 14,
                    onTap: () {
                      setState(() {
                        isLoading=true;
                      });
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Get.toNamed(RouteName.welcomeScreen);
                        Get.snackbar('Register', 'Login successfully',
                            duration: Duration(seconds: 3));
                        setState(() {
                          isLoading=false;
                        });
                      }
                      setState(() {
                        isLoading=false;
                      });
                    },
                  ),
                  SizedBox(height: size.height * 0.05),
                  Row(
                    children: <Widget>[
                      Expanded(child: Divider(thickness: isTablet ? 2 : 1, color: AppColors.darkGreyColor)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: AppText(text: "Or continue with", fontSize: isTablet ? 20 : 12),
                      ),
                      Expanded(child: Divider(thickness: isTablet ? 2 : 1, color: AppColors.darkGreyColor)),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const IconButtons(
                        icon: AppAssets.googleIcon,
                      ),
                      SizedBox(width: size.width * 0.05),
                      const IconButtons(
                        icon: AppAssets.facebookIcon,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.04),
                  RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(
                        color: context.customTheme.textColor,
                        fontSize: isTablet ? 20 : 12,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RouteName.signupScreen);
                            },
                          text: 'sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: isTablet ? 20 : 12,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}