import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BottonScreen extends StatefulWidget {
  const BottonScreen({Key? key}) : super(key: key);

  @override
  State<BottonScreen> createState() => _BottonScreenState();
}

class _BottonScreenState extends State<BottonScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("AllApp"),

        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('pattern');
                },
                child: Text("pattern"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('todo');
                },
                child: Text("todo"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('api');
                },
                child: Text("api"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
