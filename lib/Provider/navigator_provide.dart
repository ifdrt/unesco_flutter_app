import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unesco/Views/home.dart';
import 'package:unesco/data/Model/info_model.dart';
import 'package:unesco/data/dataProvider/api.dart';

class NavigateProv extends ChangeNotifier {
  int selctedIndex = 0;
  String title = "";
  Widget view = HomePage();
  bool init = false;
  ini() {
    view = HomePage();
    notifyListeners();
  }

  navigateView(Widget view1, int index1, String title1) {
    selctedIndex = index1;
    title = title1;
    view = view1;
    if (!init) {
      init = true;
    } else {
      notifyListeners();
    }
  }

  InfoModel? infoModel;
  List<String?>? orderType;
  bool infoLoading = false;
  getInfo() async {
    if (infoModel == null) {
      infoLoading = true;

      try {
        infoModel = await API.getArgumentApi();
        orderType =
            infoModel?.reportTypes!.map((report) => report.title).toList();
      } catch (e) {}
      infoLoading = false;
      notifyListeners();
    } else {
      infoLoading = false;
    }
  }
}
