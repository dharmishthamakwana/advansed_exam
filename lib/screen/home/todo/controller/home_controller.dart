
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxDouble value = 0.0.obs;
  RxList pattern = [].obs;
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  TextEditingController txtuseremail = TextEditingController();
  TextEditingController txtuserpassword = TextEditingController();
  String note1 = "";
  String note2 = "";
  String uname = "";
  bool? login;
  String? email;
}
