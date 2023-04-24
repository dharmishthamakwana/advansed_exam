import 'dart:convert';

import 'package:advansed_exam/screen/home/corona/modal/corona_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<HomeModel> GetApiCall() async {
    String Link =
        "https://corona-virus-world-and-india-data.p.rapidapi.com/api";
    Uri uri = Uri.parse(Link);
    var response = await http.get(uri, headers: {
      "content-type": "application/octet-stream",
      "X-RapidAPI-Key": "b3e94325fbmsh8a4d63c1790f718p1bba48jsn648e6d5d744e",
      "X-RapidAPI-Host": "corona-virus-world-and-india-data.p.rapidapi.com"
    });
    dynamic json = jsonDecode(response.body);
    HomeModel homeModel = HomeModel.fromJson(json);
    return homeModel;
  }
}
