import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/TodoController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   TodoController todoController = Get.put(TodoController());
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff474747),
      appBar: AppBar(
        backgroundColor: Color(0xff474747),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.rectangle_grid_2x2,
            color: Colors.white,
          ),
        ),
        title: const Center(
          child: Text(
            'TODO',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.line_horizontal_3_decrease,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Today',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Center(
                            child: Text(
                              'ADD DETAILS',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          content: CupertinoTextField(
                            controller: textEditingController,
                          ),
                          actions: [
                            CupertinoButton(
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                todoController.TodoList.add(
                                    textEditingController.text);
                                Navigator.of(context).pop();
                                textEditingController.clear();
                              },
                            ),
                            CupertinoButton(
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                textEditingController.clear();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Container(
                      height: 60,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "ADD NEW",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Container(
              height: 700,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35)),
                color: Colors.black,
              ),
              child: Obx(
                    () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: todoController.TodoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 50, left: 25, right: 25),
                      child: InkWell(
                        onLongPress: () {
                          textEditingController.text =
                          todoController.TodoList[index];
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Center(
                                  child: Text(
                                    'EDIT DETAILS',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                content: CupertinoTextField(
                                  controller: textEditingController,
                                ),
                                actions: [
                                  CupertinoButton(
                                    child: const Text(
                                      "Save",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    onPressed: () {
                                      todoController.updateTodo(
                                          index, textEditingController.text);
                                      Navigator.of(context).pop();
                                      textEditingController.clear();
                                    },
                                  ),
                                  CupertinoButton(
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    onPressed: () {
                                      textEditingController.clear();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 70,
                          width: 300,
                          decoration: const BoxDecoration(
                            color: Color(0xff474747),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20),
                              Text(
                                todoController.TodoList[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  todoController.todoRemove(index);
                                  textEditingController.clear();
                                },
                                icon: const Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
