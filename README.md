
<h2 align = "center"> 1. Todo App </h2>



GetX is a powerful package for Flutter that simplifies state management, dependency injection, and route management. Here’s a more detailed breakdown of how GetX can be used in Flutter applications:

### **1. State Management**

GetX provides a straightforward and efficient way to manage the state of your Flutter application. 

**Usage:**
- **Create a Controller:** Define a class extending `GetxController` to manage your application's state.

  ```dart
  import 'package:get/get.dart';

  class TodoController extends GetxController {
    RxList<String> todoList = <String>[].obs;

    void addTask(String task) {
      todoList.add(task);
    }

    void removeTask(int index) {
      todoList.removeAt(index);
    }

    void updateTask(int index, String newTask) {
      todoList[index] = newTask;
    }
  }
  ```

- **Use the Controller in Your UI:** Access the controller using `Get.put()` and use `Obx()` to listen for changes in the UI.

  ```dart
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'todo_controller.dart';

  class TodoScreen extends StatelessWidget {
    final TodoController controller = Get.put(TodoController());

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Todo List')),
        body: Obx(() {
          return ListView.builder(
            itemCount: controller.todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.todoList[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.removeTask(index),
                ),
              );
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add a new task
            controller.addTask('New Task');
          },
          child: Icon(Icons.add),
        ),
      );
    }
  }
  ```

### **2. Dependency Injection**

GetX simplifies dependency management, allowing you to inject and manage dependencies in a clean and efficient manner.

**Usage:**
- **Register Dependencies:** Use `Get.put()` to register a dependency.

  ```dart
  final TodoController controller = Get.put(TodoController());
  ```

- **Dependency Management:** Automatically manage dependencies, allowing you to fetch them wherever needed without manually passing them around.

### **3. Route Management**

GetX also provides a powerful routing system that makes it easier to manage and navigate between screens.

**Usage:**
- **Define Routes:** Use `GetMaterialApp` to define your routes.

  ```dart
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'todo_screen.dart';

  void main() {
    runApp(
      GetMaterialApp(
        initialRoute: '/todo',
        getPages: [
          GetPage(name: '/todo', page: () => TodoScreen()),
          // Define other routes here
        ],
      ),
    );
  }
  ```

- **Navigate Between Screens:** Use `Get.to()` for navigation and `Get.back()` for returning to the previous screen.

  ```dart
  Get.to(() => NextScreen());
  ```

### **4. Dialogs and Bottom Sheets**

GetX also provides simple methods for showing dialogs and bottom sheets.

**Usage:**
- **Show a Dialog:**

  ```dart
  Get.defaultDialog(
    title: 'Dialog Title',
    content: Text('This is a GetX dialog'),
    onConfirm: () {
      // Perform action
    },
  );
  ```

- **Show a Bottom Sheet:**

  ```dart
  Get.bottomSheet(
    Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Text('This is a bottom sheet'),
      ),
    ),
  );
  ```

### **5. Reactive Programming**

GetX enables reactive programming with Rx variables, making it easy to react to state changes.

**Usage:**
- **Create Reactive Variables:**

  ```dart
  RxInt count = 0.obs;
  ```

- **Use in the UI:**

  ```dart
  Obx(() => Text('Count: ${controller.count}'));
  ```

### **Conclusion**

GetX provides a comprehensive solution for state management, dependency injection, route management, and more in Flutter applications. Its simplicity and efficiency make it a popular choice for developers looking to streamline their Flutter development process.



<details> 
  <summary><h2>📸Photo / 📽Video</h2></summary>
  <p>
    <table align="center">
      <tr>
        <td><img src="https://github.com/user-attachments/assets/c67b5e74-a5bb-4129-9a04-b5ae19533455" alt="Image 2" width="300" height="auto"></td>
        <td><img src="https://github.com/user-attachments/assets/f21bf895-418c-4814-be7a-96f1985e8309" alt="Image 2" width="300" height="auto"></td>
        <td><video src="https://github.com/user-attachments/assets/f3473269-abf7-4621-a42e-ad0cbdcb2a74" width="420" height="315"></video>
        </td>
      </tr>
    </table>   
  </p>
</details>



