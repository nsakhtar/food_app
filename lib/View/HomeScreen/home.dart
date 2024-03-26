import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/Controllers/HomeScreenController/home_screen_controller.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';
import '../../res/AppAssets/app_assets.dart';
import '../../res/AppColors/app_colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    final bool isTabletScreen = size.width >= 600 && size.width < 1023;
    final HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return Obx(() =>Scaffold(
      body: homeScreenController.pages[homeScreenController.myCurrentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: isSmallScreen?14:isTabletScreen?20:18,
        unselectedFontSize: isSmallScreen?12:isTabletScreen?18:16,
        backgroundColor: context.customTheme.bgcolor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        showUnselectedLabels: true,
        onTap: (index) => homeScreenController.onTap(index),
        currentIndex: homeScreenController.myCurrentIndex.value,
        items: [
          BottomNavigationBarItem(
            backgroundColor: context.customTheme.bgcolor,
            icon: Icon(Icons.home_outlined,size: isSmallScreen?25:isTabletScreen?40:30,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: context.customTheme.bgcolor,
            icon: Icon(Icons.explore_outlined,size:isSmallScreen?25:isTabletScreen?40:30,),
            label: "Explore",
          ),
          // BottomNavigationBarItem(
          //   backgroundColor: context.customTheme.bgcolor,
          //   icon:SvgPicture.asset(
          //     AppAssets.appliedIcon,
          //     width: isTabletScreen? 40:24,
          //     height: isTabletScreen? 40:24,
          //     color: homeScreenController.myCurrentIndex.value == 2 ? AppColors.primaryColor : AppColors.greyColor, // Change color based on selection
          //   ),
          //   label: "Applied",
          // ),
          BottomNavigationBarItem(
            backgroundColor: context.customTheme.bgcolor,
            icon: SvgPicture.asset(
              AppAssets.saveIcon,
              width: isSmallScreen?25:isTabletScreen?40:30,
              height: isSmallScreen?25:isTabletScreen?40:30,
              color: homeScreenController.myCurrentIndex.value == 2? AppColors.primaryColor : AppColors.greyColor, // Change color based on selection
            ),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            backgroundColor: context.customTheme.bgcolor,
            icon: Icon(Icons.person_outline,size: isSmallScreen?25:isTabletScreen?40:30,),
            label: "Profile",
          ),
        ],
      ),
    ),
    );
  }
}
