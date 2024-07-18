import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/TodoController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoController todoController = Get.put(TodoController());
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.rectangle_grid_2x2,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            'TODO',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
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
            SizedBox(height: 35),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 25),
                  child: Text(
                    'Today',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title:Center(child: Text('ADD DEATILS',style: TextStyle(color: Colors.blue),)) ,
                          actions: [
                          CupertinoTextField(
                              decoration: BoxDecoration(
                              ),
                              controller: textEditingController,
                            ),
                            CupertinoButton(
                              child: Text("Save",style: TextStyle(color: Colors.blue),),
                              onPressed: () {
                                todoController.TodoList.add(textEditingController.text);
                                textEditingController.clear();
                                Get.back();
                              },
                            ),
                            CupertinoButton(
                              child: Text("Cancel",style: TextStyle(color: Colors.blue),),
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
                    padding:  EdgeInsets.only(right: 25, top: 25),
                    child: Container(
                      height: 60,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Add New",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 700,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35)),
                color: Colors.white,
              ),
              child:  Obx(() => Expanded(
                  child: ListView.builder(
                    itemCount: todoController.TodoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 50,left: 25,right: 25),
                        child: Container(
                          height: 70,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Text(
                                todoController.TodoList[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  todoController.TodoList.removeAt(index);
                                  textEditingController.clear();
                                  Get.back();
                                },
                                icon: Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
