import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/res/CommonWidgets/CustomListTile/CustomListTile.dart';
import 'package:scholarship_hub/res/AppAssets/app_assets.dart';
import 'package:scholarship_hub/res/AppColors/app_colors.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';

import '../../../../../../Controllers/ThemeController/themecontroller.dart';
import '../../../../../../res/routes/route_name.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;
    final bool isTabletScreen = size.width >= 600 && size.width < 1023;
    return SafeArea(
      child: Container(
        color: context.customTheme.bgcolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: isSmallScreen?size.height * .2:isTabletScreen?size.height * .3:size.height * .2,
              // color: AppColors.primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height:isTabletScreen?100:70,
                    width:isTabletScreen?100:70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                        child: Image.asset(AppAssets.profile,fit: BoxFit.fill,),),
                  ),
                  SizedBox(width: isTabletScreen?10:7,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Aditi Sharma',
                          style: TextStyle(
                            color: context.customTheme.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: isTabletScreen?25:isSmallScreen?16:20,
                          ),
                  ),
                        Text(
                          'Aditisharma18@gmail.com',
                          style: TextStyle(
                            color: context.customTheme.textColor,
                            fontWeight: FontWeight.w300,
                            fontSize:  isTabletScreen?25:isSmallScreen?12:15,
                          ),

                  ),

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height:isSmallScreen?10:20 ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CustomListTile(
                    leadingColor: Colors.blue,
                    leadingBgColor: Colors.blue.withOpacity(.3),
                    leading: AppAssets.personIcon,
                    title: 'Profile',
                  ),
                  CustomListTile(
                    leadingColor: Colors.teal,
                    leadingBgColor: Colors.teal.withOpacity(.3),
                    leading: AppAssets.lockIcon,
                    title: 'Change password',
                  ),
                  CustomListTile(
                    leadingColor: Colors.purple,
                    leadingBgColor: Colors.purple.withOpacity(.3),
                    leading: AppAssets.notificationIcon,
                    title: 'Push Notifications',
                  ),
                  CustomListTile(
                    leadingColor: Colors.grey,
                    leadingBgColor: Colors.grey.withOpacity(.3),
                    leading: _themeController.isDarkMode.value?AppAssets.themeIcon:AppAssets.sunnyIcon,
                    title: _themeController.isDarkMode.value?'Dark mode':'Light mode',
                    childWidget: SizedBox(
                      height: isSmallScreen?30:isTabletScreen? 70:45,
                      width: isSmallScreen?40:isTabletScreen? 80:65,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Switch(
                          activeColor: Colors.white,
                          activeTrackColor: AppColors.primaryColor,
                          value: _themeController.isDarkMode.value,
                          onChanged: (newValue) {
                            _themeController.toggleTheme();
                          },
                        ),
                      ),
                    ),
                  ),
                  CustomListTile(
                    leadingColor: Colors.orangeAccent,
                    leadingBgColor: Colors.orangeAccent.withOpacity(.3),
                    leading: AppAssets.aboutIcon,
                    title: "About us",
                  ),
                  CustomListTile(
                    leadingColor: Colors.greenAccent,
                    leadingBgColor: Colors.greenAccent.withOpacity(.3),
                    onTap: () {
                      Get.toNamed(RouteName.countriesListScreen);
                    },
                    leading: AppAssets.appliedIcon,
                    title: "All scholarships",
                  ),
                  CustomListTile(
                    leadingColor: Colors.grey,
                    leadingBgColor: Colors.grey.withOpacity(.3),
                    leading: AppAssets.settingIcon,
                    title: 'Settings ',
                  ),
                  CustomListTile(
                    leadingColor: Colors.orange,
                    leadingBgColor: Colors.orange.withOpacity(.3),
                    leading: AppAssets.contactusIcon,
                    title: 'Contact us',
                  ),
                  CustomListTile(
                    leadingBgColor: Colors.redAccent.withOpacity(.3),
                    leading: AppAssets.logoutIcon,
                    title: 'Log out',
                    leadingColor: Colors.red,
                    titleColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
