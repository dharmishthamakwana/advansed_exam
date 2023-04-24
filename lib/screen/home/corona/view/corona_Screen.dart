import 'dart:ui';

import 'package:advansed_exam/screen/home/corona/modal/corona_modal.dart';
import 'package:advansed_exam/utiles/api_helper/helperApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../todo/controller/home_controller.dart';

class CoronaScreen extends StatefulWidget {
  const CoronaScreen({Key? key}) : super(key: key);

  @override
  State<CoronaScreen> createState() => _CoronaScreenState();
}

class _CoronaScreenState extends State<CoronaScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                  child: Image.asset(
                    'assets/image/background.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      FutureBuilder<CoronaModal?>(
                        future: ApiCall().getData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("Not Found"),
                            );
                          } else if (snapshot.hasData) {
                            List<CountriesStat>? l1 =
                                snapshot.data!.countriesStat;
                            return ListView.builder(
                              itemCount: l1!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${l1[index].countryName}",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.orange,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.yellow,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Cases :- ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8),
                                        ),
                                        Text(
                                          "${l1[index].deaths}",
                                          style:
                                          TextStyle(color: Colors.white60),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Deaths :- ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8),
                                        ),
                                        Text(
                                          "${l1[index].cases}",
                                          style:
                                          TextStyle(color: Colors.white60),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total Recovered :- ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8),
                                        ),
                                        Text(
                                          "${l1[index].totalRecovered}",
                                          style:
                                          TextStyle(color: Colors.white60),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Active Cases :- ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8),
                                        ),
                                        Text(
                                          "${l1[index].activeCases}",
                                          style:
                                          TextStyle(color: Colors.white60),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Divider(color: Colors.orange)
                                  ],
                                );
                              },
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
