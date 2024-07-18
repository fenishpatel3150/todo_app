import 'package:get/get.dart';

class TodoController extends GetxController
{

  RxList TodoList = [].obs;




  void todoRemove(int index)
  {
      TodoList.removeAt(index);
  }


}