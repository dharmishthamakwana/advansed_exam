import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/corona_controller.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  ApiProvider? apiProviderT;
  ApiProvider? apiProviderF;

  @override
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).JsonParsing();
  }

  @override
  Widget build(BuildContext context) {
    apiProviderF = Provider.of<ApiProvider>(context, listen: false);
    apiProviderT = Provider.of<ApiProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Corona Api"),
          ),
          body: (apiProviderT!.homeModel == null)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, 'data', arguments: index);
                      },
                      title: Text(
                          "Country Name : ${apiProviderT!.homeModel!.countriesStat[index].countryName}"),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total Cases'),
                          Text(
                              "${apiProviderT!.homeModel!.countriesStat[index].cases}"),
                        ],
                      ),
                    ),
                  ),
                  itemCount: apiProviderT!.homeModel!.countriesStat.length,
                )),
    );
  }
}
