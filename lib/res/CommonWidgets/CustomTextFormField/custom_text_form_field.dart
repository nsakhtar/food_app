import 'package:flutter/material.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';
import '../../AppColors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final double? hintTextFontSize;
  final String? labelText;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? onTap,onPressed;
  final bool obscureText;
  final bool readOnly;
  final bool filled;
  final Color? suffixIconColor, line2Color,line1Color,fillColor,borderColor,hintTextColor,cursorColor,textColor;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String?)?onSaved;
  const CustomTextFormField({
    Key? key,
    this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.obscureText = false,
    this.readOnly = false,
    this.suffixIconColor, this.line2Color, this.line1Color, this.fillColor,  this.filled = false, this.hintTextFontSize, this.contentPadding, this.borderColor, this.controller, this.hintTextColor, this.cursorColor, this.textColor, this.onPressed, this.validator, this.keyboardType, this.onChanged, this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      onTap: onPressed,
      controller: controller,
      validator:validator,
      readOnly: readOnly,
      obscureText: obscureText,
      style: TextStyle(
          color: textColor??context.customTheme.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      cursorColor: cursorColor??AppColors.greyColor,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        labelText: labelText,
        labelStyle: TextStyle(
            color: context.customTheme.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        hintText: hintText,
        hintStyle: TextStyle(
            color: hintTextColor??context.customTheme.textColor,
            fontSize: hintTextFontSize??14,
            fontWeight: FontWeight.w400),
        border: InputBorder.none,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: borderColor??AppColors.darkGreyColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color:borderColor?? Colors.red,width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color:borderColor?? Colors.red,width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:borderColor?? AppColors.darkGreyColor,width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            decoration:  BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: line1Color ??AppColors.darkGreyColor,
                  width: 2,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                prefixIcon,
                color: context.customTheme.iconColor,
              ),
            ),
          ),
        )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.symmetric( horizontal:10 ),
            decoration:  BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: line2Color ?? Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: onTap,
              child: Icon(
                suffixIcon,
                color: suffixIconColor ?? context.customTheme.iconColor,
                size: 22,
              ),
            ),
          ),
        )
            : null,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

}
