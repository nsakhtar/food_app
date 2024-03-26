import 'package:flutter/material.dart';
import 'package:recipe_food/CommenWidget/app_text.dart';

import '../Helpers/colors.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: 312,
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'New Recipe Alert!',
            textColor: Colors.black,
            fontSize: 11,
          ),
          AppText(
            text:
                'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum',
            textColor: AppColors.greyColor,
            fontWeight: FontWeight.w400,
            fontSize: 11,
          ),
          AppText(
            text: '10 mins ago',
            textColor: AppColors.greyColor,
            fontSize: 7,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
