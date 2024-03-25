import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedValue = "Light".obs; // Using Rx for reactive updates

  void setSelectedValue(String theme) {
    selectedValue.value = theme;
    if (theme.obs == "Dark") {
      Get.changeThemeMode(ThemeMode.dark);
      update();
    }
    if (theme.obs == "Light") {
      Get.changeThemeMode(ThemeMode.light);
      update();
    }
  }
}
