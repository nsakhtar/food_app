

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String hintText;
  final double? width,height;
  const CustomTextFormField({
    Key? key,
    this.label,
    required this.hintText, this.width, this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: label??'',
          textColor: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5),
        SizedBox(
          height: height??55,
          width: width ?? double.infinity,
          child: TextFormField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
