import 'package:advansed_exam/utiles/api_helper/helperApi.dart';
import 'package:flutter/widgets.dart';

import '../modal/corona_modal.dart';

class CoronaProvider extends ChangeNotifier {
  HomeModel? homeModel;

  Future<void> JsonParsing() async {
    ApiHelper apiHelper = ApiHelper();
    homeModel = await apiHelper.GetApiCall();
    notifyListeners();
  }
}
