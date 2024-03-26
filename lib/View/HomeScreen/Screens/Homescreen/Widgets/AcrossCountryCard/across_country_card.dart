import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/res/AppAssets/app_assets.dart';
import 'package:scholarship_hub/res/CommonWidgets/AppText/app_text.dart';
import 'package:scholarship_hub/res/CommonWidgets/CustomButton/custom_button.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';
import 'package:scholarship_hub/res/routes/route_name.dart';

class AcrossCountryCard extends StatelessWidget {
  const AcrossCountryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 252,
      width: 250,
      decoration: BoxDecoration(
        color: context.customTheme.cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssets.card1,fit: BoxFit.fill,width: double.infinity,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,),
            child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppText(
                text: 'Award',
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              AppText(
                text: 'Up to INR 75,000/-',
                fontSize: 12,
              ),
              SizedBox(
                height: 3,
              ),
              AppText(
                text: 'UEligibility',
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              AppText(
                text: 'UG & Post Graduate Students',
                fontSize: 12,
              ),
            ]),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  textColor: Colors.white,
                  label: 'View Details',
                  height: 25,
                  width: 100,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  onTap: () {
                    Get.toNamed(RouteName.scholarshipDetailScreen);
                  },
                ),
                AppText(text:'5-March-2024',fontSize: 10,)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
