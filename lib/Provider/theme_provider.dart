import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive/hive.dart';
import 'package:unesco/Builder/theme_builder.dart';
import 'package:unesco/data/dataProvider/api.dart';

class ThemeUtils extends ChangeNotifier {
  ThemeData? _themeData;
  bool login = false;
  int status = 0;
  String? firebaseToken;
  BuildContext? context;

  ThemeUtils(this._themeData) {
    _themeData = themeBuilder(
        SchedulerBinding.instance!.window.platformBrightness == ThemeMode.light
            ? 1
            : 0);
  }
  getThem() => _themeData;
  setThem(ThemeData themeData) {
    _themeData = themeData;

    notifyListeners();
  }

  getstatusRequest(BuildContext context1) async {
    await getStatus();
    int a = await API.getStatusApi();

    if (a != status) {
      status = a;
      notifyListeners();
    }

    setStatus(a);
  }

  Future<int> getStatus() async {
    var box = await Hive.openBox('unescoDataBase');

    try {
      status = int.parse((await box.get("status")).toString());
    } catch (e) {
      // print(e);
    }

    notifyListeners();
    return status;
  }

  Future setStatus(int status) async {
    var box = await Hive.openBox('unescoDataBase');

    await box.put("status", status);
  }
}
