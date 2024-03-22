// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/API/API.dart';
import 'package:note_app/Helpers/Colors.dart';
import 'package:note_app/Helpers/ScreenLength.dart';
import 'package:note_app/Reusable/TextField.dart';

import '../../GetXControllers.dart/NoteController.dart';

class AddNoteScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TodoController todoController = Get.find();
  final _formKey = GlobalKey<FormState>();

  AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtil.screenHeight(context);
    double screenWidth = ScreenUtil.screenWidth(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Create Note",
          style: TextStyle(fontFamily: "Montserrat"),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: titleController,
                    labelText: 'Title',
                    validator: (value) =>
                        value!.isEmpty ? "Title can't be empty" : null,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextFormField(
                    controller: messageController,
                    labelText: 'Content',
                    validator: (value) =>
                        value!.isEmpty ? "Content can't be empty" : null,
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            postData(
                                titleController.text, messageController.text);
                            todoController.addTodo(
                              titleController.text,
                              messageController.text,
                            );
                            Get.snackbar("Success", "Successfully Created");
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor("#5FFFD8")), // Change button color here
                        ),
                        child: Text(
                          'Create',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> postData(String title, String content) async {
    try {
      var data = {
        "title": titleController.text,
        "message": messageController.text,
      };
      print(data);
      print("object");
      var res = await CallApi().postData(data, 'note/note');
      print("januyan");
      print(res);
      var body = json.decode(res.body);
      print(body);

      ;
    } catch (e) {}
  }
}
