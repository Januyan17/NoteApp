// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/Screens/HomeScreen/HomeScreen.dart';

void main() {
  runApp(GetMaterialApp(
    // theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class Todo {
//   String title;
//   String message;

//   Todo({
//     required this.title,
//     required this.message,
//   });
// }

// class TodoController extends GetxController {
//   var todos = <Todo>[].obs;

//   void addTodo(String title, String message) {
//     todos.add(Todo(title: title, message: message));
//     Get.back(); // Navigate back to the previous screen
//     Get.toNamed('/'); // Navigate to the view screen
//   }

//   void removeTodo(int index) {
//     if (index >= 0 && index < todos.length) {
//       todos.removeAt(index);
//       update();
//     } else {
//       print("Invalid index: $index");
//     }
//   }
// }

// class AddTodoScreen extends StatelessWidget {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController messageController = TextEditingController();
//   final TodoController todoController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Todo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(
//                 labelText: 'Title',
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: messageController,
//               decoration: InputDecoration(
//                 labelText: 'Message',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 todoController.addTodo(
//                   titleController.text,
//                   messageController.text,
//                 );
//               },
//               child: Text('Add Todo'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ViewTodoScreen extends StatelessWidget {
//   final TodoController todoController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('View and Delete Todos'),
//       ),
//       body: Obx(() => ListView.builder(
//             itemCount: todoController.todos.length,
//             itemBuilder: (context, index) => ListTile(
//               title: Text(todoController.todos[index].title),
//               subtitle: Text(todoController.todos[index].message),
//               trailing: IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () => todoController.removeTodo(index),
//               ),
//             ),
//           )),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   final TodoController todoController = Get.put(TodoController());

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'TODO App',
//       initialRoute: '/add',
//       getPages: [
//         GetPage(name: '/', page: () => ViewTodoScreen()),
//         GetPage(name: '/add', page: () => AddTodoScreen()),
//       ],
//     );
//   }
// }
