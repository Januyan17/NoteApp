// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/GetXControllers.dart/NoteController.dart';
import 'package:note_app/GetXControllers.dart/ThemeController.dart';
import 'package:note_app/Helpers/Colors.dart';
import 'package:note_app/Helpers/ScreenLength.dart';
import 'package:note_app/Screens/AddNote/AddNote.dart';
import 'package:note_app/Screens/Settings/Settings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TodoController todoController = Get.put(TodoController());
  final ThemeController themeController = Get.put(ThemeController());

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Responsive Length Declaration

    double screenHeight = ScreenUtil.screenHeight(context);
    double screenWidth = ScreenUtil.screenWidth(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Genius is One Percent inspiration and ninety-nine percent perspiration",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Text(
                  "Thomos Edition ,type.fit",
                  style: TextStyle(
                    fontFamily: "MontserratNormal",
                    fontSize: 11,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                //Search Bar
                Row(
                  children: [
                    Expanded(
                        child: Obx(
                      () => Container(
                        width: screenHeight * 0.3,
                        child: TextFormField(
                          controller: searchController,
                          onChanged: (value) {
                            todoController.filterNotes(value);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: HexColor("#D9D9D9"),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: HexColor("#D9D9D9"),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                                color: themeController.isDarkMode.value
                                    ? HexColor("#D9D9D9")
                                    : HexColor("#D4D4D4")),
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            fillColor: themeController.isDarkMode.value
                                ? HexColor("#2d2d2d")
                                : Colors.white,
                          ),
                        ),
                      ),
                    )),
                    SizedBox(width: screenWidth * 0.1),
                    //Settings
                    Obx(
                      () => Container(
                        width: screenWidth * 0.15,
                        height: screenHeight * 0.15,
                        decoration: BoxDecoration(
                          color: themeController.isDarkMode.value
                              ? HexColor("#2d2d2d")
                              : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: HexColor("#D9D9D9"),
                            width: 1.0,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(SettingsScreen());
                          },
                          icon: Icon(Icons.settings),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  height: screenHeight * 0.6,
                  width: screenWidth,
                  child: Obx(() {
                    if (todoController.filteredNotes.isEmpty) {
                      // Show a message when no data is found
                      return Center(
                        child: Text(
                          "No data found",
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    } else {
                      // Show the ListView.builder when there is data
                      return ListView.builder(
                        itemCount: todoController.filteredNotes.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: HexColor("#D9D9D9"),
                                  width: 1.0,
                                ),
                              ),
                              child: Obx(() => ListTile(
                                    tileColor: themeController.isDarkMode.value
                                        ? HexColor("#2d2d2d")
                                        : Colors.white,
                                    title: Text(
                                      todoController.filteredNotes[index].title,
                                    ),
                                    subtitle: Text(
                                      todoController
                                          .filteredNotes[index].message,
                                    ),
                                    trailing: Container(
                                      width: screenWidth * 0.11,
                                      height: screenHeight * 0.11,
                                      decoration: BoxDecoration(
                                        color: themeController.isDarkMode.value
                                            ? HexColor("#2d2d2d")
                                            : Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: HexColor("#D9D9D9"),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          todoController.removeTodo(index);
                                          Get.snackbar("Success",
                                              "Successfully Deleted");
                                        },
                                      ),
                                    ),
                                  )),
                            ),
                          );
                        },
                      );
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(AddNoteScreen());
        },
        shape: CircleBorder(),
        foregroundColor: Colors.black,
        backgroundColor: HexColor("#5FFFD8"),
      ),
    );
  }
}
