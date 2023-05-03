import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/home_provider.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  CoronaProvider? apiProviderTrue;
  CoronaProvider? apiProviderFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<CoronaProvider>(context, listen: false).JsonParsing();
  }

  @override
  Widget build(BuildContext context) {
    apiProviderFalse = Provider.of<CoronaProvider>(context, listen: false);
    apiProviderTrue = Provider.of<CoronaProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.cyan.shade900,
          title: Text("Corona APP"),
        ),
        body: (apiProviderTrue!.homeModel == null)
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image(
                        image: AssetImage(
                          "assets/image/background.jpg",
                        ),
                        fit: BoxFit.cover,
                      )),
                  ListView.builder(
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 3),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, 'data',
                              arguments: index);
                        },
                        title: Text(
                          "Country Name : ${apiProviderTrue!.homeModel!.Countries[index].countryName}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Cases',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${apiProviderTrue!.homeModel!.Countries[index].cases}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: apiProviderTrue!.homeModel!.Countries.length,
                  ),
                ],
              ),
      ),
    );
  }
}
