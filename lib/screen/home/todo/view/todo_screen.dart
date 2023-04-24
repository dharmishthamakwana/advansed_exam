
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utiles/sherd/sher.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}


class _SpleshScreenState extends State<SpleshScreen> {

@override
void initState() {
  super.initState();
  Timer(
    const Duration(seconds: 2),
        () async {
      bool? a = await readlogin();
      if (a != true) {
        Navigator.pushReplacementNamed(context, 'up');
      } else {
        Navigator.pushReplacementNamed(context, 'HomePage');
      }
    },
  );
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade400,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Text(
                  "TaskMe",
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "powerd by HNG",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
