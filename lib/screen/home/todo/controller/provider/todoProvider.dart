import 'package:flutter/cupertino.dart';

import '../../modal/home_modal.dart';

class TodoProvider extends ChangeNotifier
{
  List<Homemodel> taskList = [];
  List<Homemodel> doneList = [];
}
