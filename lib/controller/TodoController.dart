import 'package:get/get.dart';

class TodoController extends GetxController {
  RxList<String> TodoList = <String>[].obs;

  void updateTodo(int index, String newTitle) {
    TodoList[index] = newTitle;
    TodoList.refresh();
  }

  void todoRemove(int index) {
    TodoList.removeAt(index);
  }
}
