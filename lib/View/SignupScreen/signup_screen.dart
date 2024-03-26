/////sigup screen


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';
import '../../Controllers/SignupController/signup_controller.dart';
import '../../res/AppColors/app_colors.dart';
import '../../res/CommonWidgets/AppText/app_text.dart';
import '../../res/CommonWidgets/CustomButton/custom_button.dart';
import '../../res/CommonWidgets/CustomTextFormField/custom_text_form_field.dart';
import '../../res/routes/route_name.dart';
import '../LoginScreen/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = true;
  String password = '';
  final SignupController signupController = Get.put(SignupController());
  final formKey = GlobalKey<FormState>();
  bool emailExists = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    final bool isTablet = size.width >= 600;
    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? size.width * 0.1 : 25,
            vertical: isTablet ? size.height * 0.1 : 30,
          ),
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      text: 'Create your account',
                      fontSize: isTablet ? 24 : 20,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                        height: isSmallScreen
                            ? size.height * 0.03
                            : size.height * 0.04),
                    CustomTextFormField(
                      labelText: 'First name',
                      hintText: 'Enter your first name',
                      prefixIcon: Icons.person_2_outlined,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                        height: isSmallScreen
                            ? size.height * 0.025
                            : size.height * 0.04),
                    CustomTextFormField(
                      labelText: 'Last name',
                      hintText: 'Enter your last name',
                      prefixIcon: Icons.person_2_outlined,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                        height: isSmallScreen
                            ? size.height * 0.025
                            : size.height * 0.04),
                    CustomTextFormField(
                      keyboardType: TextInputType.number,
                      labelText: 'Mobile number',
                      hintText: 'Enter 11 digit mobile Number',
                      prefixIcon: Icons.phone_outlined,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your mobile Number';
                        } else if (value.length != 11 ||
                            int.tryParse(value) == null) {
                          return 'Please enter a valid 11-digit mobile Number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                        height: isSmallScreen
                            ? size.height * 0.025
                            : size.height * 0.04),
                    CustomTextFormField(
                      labelText: 'Email ID',
                      hintText: 'Enter your email ID',
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        } else if (!value.endsWith('@gmail.com')) {
                          return 'Please enter a Gmail address';
                        } else if (emailExists) {
                          return 'Email already exists';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                        height: isSmallScreen
                            ? size.height * 0.025
                            : size.height * 0.04),
                    Obx(
                          () => CustomTextFormField(
                        controller: signupController.passwordController,

                        prefixIcon: Icons.lock_outline,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        suffixIcon: signupController.obscureText1.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obscureText: signupController.obscureText1.value,
                        onTap: signupController.togglePasswordVisibility1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                        height: isSmallScreen
                            ? size.height * 0.025
                            : size.height * 0.04),
                    Obx(
                          () => CustomTextFormField(
                        controller: signupController.confirmPasswordController,
                        prefixIcon: Icons.lock_outline,
                        labelText: 'Confirm Password',
                        hintText: 'Re-enter your password',
                        suffixIcon: signupController.obscureText2.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obscureText: signupController.obscureText2.value,
                        onTap: signupController.togglePasswordVisibility2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your confirm password';
                          }
                          if (value !=
                              signupController.passwordController.text) {
                            return 'Passwords do not match';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                        height: isSmallScreen
                            ? size.height * 0.025
                            : size.height * 0.04),
                    Align(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(
                          text: "By clicking Sign Up, you agree to our ",
                          style: TextStyle(
                            color: context.customTheme.textColor,
                            fontSize: isTablet ? 20 : 12,
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms of Service ${isTablet ? '' : '\n'}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: isTablet ? 20 : 12,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: isTablet ? 20 : 12,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: isTablet ? 20 : 12,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    CustomButton(
                      onTap: () {

                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading=true;
                          });
                          Get.to(() => LoginScreen());
                          Get.snackbar('Register', 'Registered successfully',
                              duration: Duration(seconds: 3));
                          setState(() {
                            isLoading= true;
                          });
                        }
                      },
                      textColor: Colors.white,
                      label: isLoading?'Sign up':'Loading....',
                      fontSize: isTablet ? 22 : 14,
                    ),
                    SizedBox(height: size.height * 0.04),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: context.customTheme.textColor,
                          fontSize: isTablet ? 20 : 12,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(RouteName.loginScreen);
                              },
                            text: 'sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: isTablet ? 20 : 12,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}