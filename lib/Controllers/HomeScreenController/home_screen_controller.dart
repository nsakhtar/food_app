import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/View/HomeScreen/Screens/AppliedScreen/applied_screen.dart';
import 'package:scholarship_hub/View/HomeScreen/Screens/ExploreScreen/explore_screen.dart';
import 'package:scholarship_hub/View/HomeScreen/Screens/Homescreen/home_screen.dart';
import 'package:scholarship_hub/View/HomeScreen/Screens/ProfileScreen/profile_screen.dart';
import 'package:scholarship_hub/View/HomeScreen/Screens/SavedScreen/saved_screen.dart';

class HomeScreenController extends GetxController {
  RxInt myCurrentIndex = 0.obs;
  final pages = [
     HomeScreen(),
    const ExploreScreen(),
    // const AppliedScreen(),
    const SaveScreen(),
    ProfileScreen(),
  ];

  void onTap(int index) {
    myCurrentIndex.value = index;
  }


  //drawer code
  final AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();
  var isDrawerOpen = true.obs;

  toggleDrawer() {
    if (isDrawerOpen.value) {
      advancedDrawerController.showDrawer();
      isDrawerOpen.value = false;
    } else {
      advancedDrawerController.hideDrawer();
        isDrawerOpen.value = true;

    }
  }


}
