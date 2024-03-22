import 'package:get/get.dart';
import 'package:note_app/Class/Note.dart';

class TodoController extends GetxController {
  var note = <Note>[].obs;
  var filteredNotes = <Note>[].obs;
  var errorMsg = "".obs;

  @override
  void onInit() {
    filteredNotes.assignAll(note);
    super.onInit();
  }

  void addTodo(String title, String message) {
    note.add(Note(title: title, message: message));
    updateFilteredNotes();
    Get.back();
    Get.toNamed('/');
  }

  void removeTodo(int index) {
    if (index >= 0 && index < note.length) {
      note.removeAt(index);
      updateFilteredNotes();
      update();
    } else {
      print("Invalid index: $index");
    }
  }

  void filterNotes(String query) {
    filteredNotes.assignAll(note.where((note) {
      final titleLower = note.title.toLowerCase();
      final messageLower = note.message.toLowerCase();
      final queryLower = query.toLowerCase();

      return titleLower.contains(queryLower) ||
          messageLower.contains(queryLower);
    }).toList());
    update();
  }

  void updateFilteredNotes() {
    filteredNotes.assignAll(note);
  }
}
