import 'package:advansed_exam/screen/home/corona/Provider/home_provider.dart';
import 'package:advansed_exam/screen/home/corona/view/coronaDetail_screen.dart';
import 'package:advansed_exam/screen/home/corona/view/corona_Screen.dart';
import 'package:advansed_exam/screen/home/pattern/view/home_Screen.dart';
import 'package:advansed_exam/screen/home/todo/provider/todoProvider.dart';
import 'package:advansed_exam/screen/home/todo/view/bottam%20navigationbar.dart';
import 'package:advansed_exam/screen/home/todo/view/button_Screen.dart';
import 'package:advansed_exam/screen/home/todo/view/todo_screen.dart';
import 'package:advansed_exam/screen/signin.dart';
import 'package:advansed_exam/screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'screen/home/todo/view/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CoronaProvider(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (p0) => BottonScreen(),
          'pattern': (p0) => PatternPage(),
          'in': (p0) => SignInPage(),
          'up': (p0) => SignupPage(),
          'todo': (p0) => SpleshScreen(),
          'home': (p0) => TodoScreen(),
          'bottam': (p0) => BottomBarPage(),
          'api': (p0) => ApiScreen(),
          'data':(p0) => DataScreen(),
        },
      ),
    ),
  );
}
