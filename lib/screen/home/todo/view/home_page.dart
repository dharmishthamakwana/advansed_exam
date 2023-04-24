import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override 
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txthome = TextEditingController();
  TextEditingController txtwork = TextEditingController();
  TextEditingController txtHome = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  trailing: IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'New Task',
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(

                                decoration: InputDecoration(
                                 labelText: 'Your Work',
                              focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'choose category ',

                                  focusedBorder: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text("Cancel"),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text("Save"),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.add),
                      color: Colors.white),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.grey.shade200,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "TODO(3)",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txthome,
                  decoration: InputDecoration(
                    label: Text("home"),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtwork,
                  decoration: InputDecoration(
                    label: Text("work"),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtHome,
                  decoration: InputDecoration(
                    label: Text("Home"),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.grey.shade200,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Done(2)",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txthome,
                  decoration: InputDecoration(
                    label: Text("home"),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtwork,
                  decoration: InputDecoration(
                    label: Text("work"),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
