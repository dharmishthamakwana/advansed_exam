import 'package:advansed_exam/screen/home/todo/controller/provider/todoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/home_modal.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

TodoProvider? todoProviderTrue;
TodoProvider? todoProviderFalse;

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController txtTask = TextEditingController(text: "Project");
  TextEditingController txtCat = TextEditingController(text: "Homework");

  TextEditingController editTask = TextEditingController();
  TextEditingController editCat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    todoProviderTrue = Provider.of(context, listen: true);
    todoProviderFalse = Provider.of(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.teal,
                child: ListTile(
                  title: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("Today,May 13",
                          style: TextStyle(color: Colors.white, fontSize: 28)),
                    ),
                  ),
                  trailing: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: txtCat,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    controller: txtTask,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Homemodel h1 = Homemodel(
                                          task: txtTask.text,
                                          category: txtCat.text);
                                      todoProviderTrue!.taskList.add(h1);
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Text("Add"),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ),
              Container(
                color: Colors.grey.shade300,
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("ToDo (${todoProviderTrue!.taskList.length})",
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.teal.shade50,
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${todoProviderTrue!.taskList[index].category}",
                                style: TextStyle(color: Colors.grey.shade400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${todoProviderTrue!.taskList[index].task}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                            ],
                          ),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                todoProviderTrue!.doneList.add(Homemodel(
                                    category: todoProviderTrue!
                                        .taskList[index].category,
                                    task: todoProviderTrue!
                                        .taskList[index].task));
                                setState(() {});
                              },
                              child: Icon(
                                Icons.done,
                                color: Colors.teal.shade600,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: editCat,
                                            decoration: InputDecoration(
                                              hintText:
                                                  "${todoProviderTrue!.taskList[index].category}",
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextField(
                                            controller: editTask,
                                            decoration: InputDecoration(
                                              hintText:
                                                  "${todoProviderTrue!.taskList[index].task}",
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.teal),
                                              onPressed: () {
                                                todoProviderTrue!
                                                    .taskList[index]
                                                    .category = editCat.text;
                                                todoProviderTrue!
                                                    .taskList[index]
                                                    .task = editTask.text;
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                              child: Text("Edit"))
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                todoProviderTrue!.taskList.removeAt(index);
                                setState(() {});
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: todoProviderTrue!.taskList.length,
                ),
              ),
              Container(
                color: Colors.grey.shade300,
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(" Done (${todoProviderTrue!.taskList.length})",
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.teal.shade50,
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    padding: EdgeInsets.all(10),
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${todoProviderTrue!.doneList[index].category}",
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${todoProviderTrue!.doneList[index].task}",
                          style: TextStyle(color: Colors.black, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  itemCount: todoProviderTrue!.doneList.length,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(color: Colors.teal),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.teal,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.date_range,
                  color: Colors.teal,
                ),
                label: "Date"),
          ],
        ),
      ),
    );
  }
}
