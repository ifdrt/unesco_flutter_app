import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:path_provider/path_provider.dart';
import 'package:unesco/data/Model/home_model.dart';
import 'package:unesco/data/Model/imagemodel.dart';
import 'package:unesco/data/Model/info_model.dart';
import 'package:unesco/data/Model/news_model.dart';

import 'main_info.dart';

class API {
  static Future<ImageDataMOdel> getImagesTest() async {
    //urn:ietf:wg:oauth:2.0:oob
    //2jFccC5YQL8h3LRFOyXyPsX9mdCuPnnJ4KDPwhGWx_c
    //elWCy37z-lv15dWylPaGxhKz1aPvli7EDDP-scI4MhY
    var url = Uri.parse(
        "https://api.unsplash.com/photos?client_id=2jFccC5YQL8h3LRFOyXyPsX9mdCuPnnJ4KDPwhGWx_c");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var body = {"data_image": json.decode(response.body)};

      return ImageDataMOdel.fromJson(body);
    } else {
      return null!;
    }
  }

  static Future<int> getStatusApi() async {
    var url = Uri.parse(Info.chek_url);

    var response = await http.get(
      url,
    );
    print(url.toString());
    print(response.body);
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      int body = res['status'] == true ? 1 : 0;
      ;
      return body;
    } else {
      return 0;
    }
  }

  static Future<http.Response?> submitReport(dynamic data) async {
    var url = Uri.parse(Info.report_submit_url);

    return await http.post(url,
        headers: {"Content-Type": "application/json"}, body: json.encode(data));
  }

  static Future<http.Response?> submitQuestioin(dynamic data) async {
    var url = Uri.parse(Info.question_submit_url);

    return await http.post(url,
        headers: {"Content-Type": "application/json"}, body: json.encode(data));
  }

  static Future<HomeModel?> gethomeApi() async {
    var url = Uri.parse(Info.home_url);
    print("3234dff" + url.toString());
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return HomeModel.fromJson(body);
    }
  }

  static Future<NewsModel?> getnewsApi() async {
    var url = Uri.parse(Info.news_url);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var body = {"data_news": json.decode(response.body)};

      return NewsModel.fromJson(body);
    }
  }

  static Future<InfoModel?> getArgumentApi() async {
    var url = Uri.parse(Info.argumentUrl);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return InfoModel.fromJson(body);
    }
  }
}
