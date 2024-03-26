

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Res/MyTheme/dark_theme.dart';
import '../../Res/MyTheme/light_theme.dart';


class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
    saveTheme();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    saveTheme();
    updateTheme();
  }

  Future<void> loadTheme() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      isDarkMode.value = prefs.getBool('isDarkMode') ?? false;  // Set initial value to false
      updateTheme();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> saveTheme() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isDarkMode', isDarkMode.value);
    } catch (e) {
      // Handle error
    }
  }

  void updateTheme() {
    Get.changeTheme(isDarkMode.value ? darkTheme() : lightTheme());
  }
}
