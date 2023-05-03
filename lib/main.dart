import 'package:advansed_exam/screen/home/corona/Provider/home_provider.dart';
import 'package:advansed_exam/screen/home/corona/view/coronaDetail_screen.dart';
import 'package:advansed_exam/screen/home/corona/view/corona_Screen.dart';
import 'package:advansed_exam/screen/home/pattern/view/home_Screen.dart';
import 'package:advansed_exam/screen/home/todo/provider/todoProvider.dart';
import 'package:advansed_exam/screen/home/todo/view/bottam%20navigationbar.dart';
import 'package:advansed_exam/screen/button_Screen.dart';
import 'package:advansed_exam/screen/home/todo/view/todo_screen.dart';
import 'package:advansed_exam/screen/signin.dart';
import 'package:advansed_exam/screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'screen/home/todo/view/todo.dart';

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
          '/': (p0) => const BottonScreen(),
          'pattern': (p0) => const PatternPage(),
          'in': (p0) => const SignInPage(),
          'up': (p0) => const SignupPage(),
          'todo': (p0) => const SpleshScreen(),
          'home': (p0) => const TodoScreen(),
          'bottam': (p0) => const BottomBarPage(),
          'api': (p0) => const ApiScreen(),
          'data': (p0) => const DataScreen(),
        },
      ),
    ),
  );
}
