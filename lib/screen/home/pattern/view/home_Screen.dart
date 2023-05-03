import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class PatternPage extends StatefulWidget {
  const PatternPage({Key? key}) : super(key: key);

  @override
  State<PatternPage> createState() => _PatternPageState();
}

class _PatternPageState extends State<PatternPage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Pattern",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              height: 200, width: 200,
              child: Obx(
                () => ListView.builder(
                  itemCount: homeController.pattern.length,
                  itemBuilder: (context, index) {
                    return Text(
                      "${homeController.pattern[index]}",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    );
                  },
                ),
              ),
              // color: Colors.red,
            ),
            SizedBox(
              height: Get.height / 15,
            ),
            Obx(
              () => Slider(
                inactiveColor: Colors.grey,
                activeColor: Colors.black,
                label: "${homeController.value.value}",
                value: homeController.value.value,
                onChanged: (value) {
                  print("===== $value");
                  homeController.value.value = value;
                  homeController.pattern.clear();
                  for (int i = 1; i <= value.round(); i++) {
                    List data = [];
                    for (int j = 1; j <= i; j++) {
                      data.add(j);
                    }
                    homeController.pattern.add(data);
                  }
                },
                max: 10,
                min: 0,
                divisions: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
