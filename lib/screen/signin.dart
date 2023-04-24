import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utiles/sherd/sher.dart';
import 'home/todo/controller/home_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    alreadylogin(false);

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
                        const SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            controller: homeController.txtuseremail,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              enabled: true,
                              enabledBorder: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(),
                              suffixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              label: const Text("Username"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            controller: homeController.txtuserpassword,
                            obscureText: !_passwordVisible,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(),
                              enabled: true,
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
                                    _passwordVisible = !_passwordVisible;
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
                              homeController.note2,
                              style: const TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: InkWell(
                            onTap: () async {
                              String? password = await readpasswordpref();
                              String? email = await reademailpref();

                              if (homeController.txtuseremail.text == email ||
                                  homeController.txtuserpassword.text ==
                                      password) {
                                homeController.note2 = "";
                                alreadylogin(true);
                                createusershe(homeController.txtuseremail.text,
                                    homeController.txtuserpassword.text);
                                Get.toNamed('bottam');
                              } else {
                                homeController.note2 = "Wrong information";
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient:  LinearGradient(
                                    colors: [Colors.teal, Colors.teal.shade200,]),
                              ),
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 650,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, 'up');
                                },
                                child: const Text(
                                  " Sign up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ),
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
