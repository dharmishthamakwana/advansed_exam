import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utiles/sherd/sher.dart';
import 'home/todo/controller/home_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool? _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        const Text(
                          "Create",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            color: Color(0xff4b74a6),
                          ),
                        ),
                        const Text(
                          "account",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xff4b74a6),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: homeController.txtemail,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              enabled: true,
                              focusedBorder: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(),
                              suffixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              label: const Text("E-mail"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            obscureText: !_passwordVisible!,
                            controller: homeController.txtpassword,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              enabled: true,
                              focusedBorder: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(),
                              label: const Text("Password"),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              homeController.note1,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: InkWell(
                            onTap: () {
                              if (homeController.txtpassword.text != "" ||
                                  homeController.txtemail.text != "") {
                                homeController.note1 = "";
                                createshe(homeController.txtemail.text,
                                    homeController.txtpassword.text);
                                Navigator.pushReplacementNamed(context, 'in');
                              } else {
                                homeController.note1 = "Invalid information";
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [Color(0xff4b74a6), Colors.blue]),
                              ),
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 670,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, 'in');
                                },
                                child: const Text(
                                  " Sign in",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
