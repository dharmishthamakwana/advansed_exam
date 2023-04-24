import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'home_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TodoScreen(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month,
                ),
                label: "Calender"),
          ],
        ),
      ),
    );
  }
}
