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
          backgroundColor: Colors.teal.shade900,
          title: Text("AllApp"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.teal.shade700,
            Colors.teal.shade400,
            Colors.teal.shade100
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  Get.toNamed('pattern');
                },
                child: Text("pattern"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  Get.toNamed('todo');
                },
                child: Text("todo"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
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
