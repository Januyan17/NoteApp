// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/GetXControllers.dart/DropDownController.dart';
import 'package:note_app/Helpers/ScreenLength.dart';

import '../../GetXControllers.dart/ThemeController.dart';
import '../../Helpers/Colors.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final DropdownController dropdownController = Get.put(DropdownController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(fontFamily: "Montserrat"),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Theme",
                      style: TextStyle(fontFamily: "Montserrat", fontSize: 15),
                    ),

                    //Drop down
                    Obx(() => Container(
                          width: screenWidth * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: themeController.isDarkMode.value
                                  ? HexColor("#2d2d2d")
                                  : HexColor("#D4D4D4"),
                              width: 1.0,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownController.selectedValue.value,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  themeController.toggleTheme();
                                  dropdownController.setSelectedValue(newValue);
                                }
                              },
                              style: TextStyle(
                                color: themeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16.0,
                              ),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24.0,
                              dropdownColor: themeController.isDarkMode.value
                                  ? HexColor("#2d2d2d")
                                  : Colors.white,
                              elevation: 8,
                              items: <String>['Light', 'Dark', 'System']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
