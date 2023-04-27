import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/home_provider.dart';


class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  CoronaProvider? apiProviderTrue;
  CoronaProvider? apiProviderFalse;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    apiProviderFalse = Provider.of<CoronaProvider>(context, listen: false);
    apiProviderTrue = Provider.of<CoronaProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan.shade900,
          title: Text(
              "${apiProviderTrue!.homeModel!.Countries[index].countryName}"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/background.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Country : ${apiProviderTrue!.homeModel!.Countries[index].countryName}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                "Total Cases : ${apiProviderTrue!.homeModel!.Countries[index].cases}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                "New Cases : ${apiProviderTrue!.homeModel!.Countries[index].newCases}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                "Active Cases : ${apiProviderTrue!.homeModel!.Countries[index].activeCases}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                "Deaths : ${apiProviderTrue!.homeModel!.Countries[index].deaths}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                "SeriousCritical Cases: ${apiProviderTrue!.homeModel!.Countries[index].seriousCritical}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                "Total Tests: ${apiProviderTrue!.homeModel!.Countries[index].totalTests}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                "TotalRecovered Cases: ${apiProviderTrue!.homeModel!.Countries[index].totalRecovered}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
