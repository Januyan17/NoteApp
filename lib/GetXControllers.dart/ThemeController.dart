import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Observe the changes in the dark mode state
  RxBool isDarkMode = Get.isDarkMode.obs;

  // Toggle dark mode
  void toggleTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    isDarkMode.value = !isDarkMode.value; // Update the state
  }
}
