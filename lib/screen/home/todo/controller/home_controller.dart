import 'dart:async';
import 'package:advansed_exam/screen/home/todo/view/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  //Only Variable's

  RxDouble value = 0.0.obs;
  RxList pattern = [].obs;
  RxInt BottomIndex = 0.obs;
  RxString month = "".obs;
  Rx<GlobalKey<FormState>> key = GlobalKey<FormState>().obs;
  Rx<GlobalKey<FormState>> loginkey = GlobalKey<FormState>().obs;
  Rx<GlobalKey<FormState>> signupkey = GlobalKey<FormState>().obs;
  Rx<TextEditingController> txtTask = TextEditingController().obs;
  Rx<TextEditingController> txtCategory = TextEditingController().obs;
  Rx<TextEditingController> txtLoginEmail = TextEditingController().obs;
  Rx<TextEditingController> txtLoginPass = TextEditingController().obs;
  Rx<TextEditingController> txtSignupEmail = TextEditingController().obs;
  Rx<TextEditingController> txtSignupPass = TextEditingController().obs;
  RxList TodoList = [].obs;
  RxList DoneList = [].obs;
  RxList Screens = [
    SpleshScreen(),

  ].obs;
  Rx<DateTime> focusdate = DateTime.now().obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  RxList AllTaskList = [].obs;

  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  TextEditingController txtuseremail = TextEditingController();
  TextEditingController txtuserpassword = TextEditingController();
  String note1 = "";
  String note2 = "";
  String uname = "";
  bool? login;
  String? email;
  //Only Function's




  // void GetAllData() async
  // {
  //   List dataList = await TodoDatabase.todoDatabase.ReadData();
  //   AllTaskList.clear();
  //   for(int i=0; i<dataList.length; i++)
  //   {
  //     if((selectedDate.value.day.toString() == dataList[i]['date']) && (selectedDate.value.month == dataList[i]['month_int']) && (selectedDate.value.year.toString() == dataList[i]['year']))
  //     {
  //       AllTaskList.add(dataList[i]);
  //     }
  //   }
  // }
  //
  // void CheckLogin() async
  // {
  //   bool? check = await ReadIsLogin();
  //   Timer(Duration(seconds: 3), () {
  //     if(check != null)
  //     {
  //       if(check)
  //       {
  //         Get.offNamed('Bottom');
  //       }
  //       else
  //       {
  //         Get.offNamed('Login');
  //       }
  //     }
  //     else
  //     {
  //       Get.offNamed('Login');
  //     }
  //   });
  // }
}