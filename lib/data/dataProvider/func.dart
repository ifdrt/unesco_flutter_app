import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'main_info.dart';

class Funct {
  BuildContext context;
  Funct(this.context);

// Future<Position> peterminePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permantly denied, we cannot request permissions.');
//   }

//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission != LocationPermission.whileInUse &&
//         permission != LocationPermission.always) {
//       return Future.error(
//           'Location permissions are denied (actual value: $permission).');
//     }
//   }

//    serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {

// var s=await Geolocator.openLocationSettings();

//  serviceEnabled = await Geolocator.isLocationServiceEnabled();

//    if (!serviceEnabled) {

//     return Future.error('Location services are disabled.');}
//     else{
//        return await Geolocator.getCurrentPosition();
//     }
//   }else{
//    return await Geolocator.getCurrentPosition();
//   }

// }
  setNewToken(String token, {required ThemeMode theme}) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // print("the new token === $token");

    // if(token!=null && !token.contains("A token is required") && !token.contains("The token has been blacklisteds")){
    //         prefs.setString("token",token);

    //        theme!=null? theme.user.token=token: null;
    //          theme!=null?theme.notifyListeners():null;}
  }

  static snakBar(
      {required Icon ic,
      required String msg,
      required Color bk,
      required BuildContext context}) {
    var sn = SnackBar(
      padding: EdgeInsets.zero,
      content: ListTile(
          dense: true,
          leading: ic,
          title: Text(
            msg,
            style: Theme.of(context).textTheme.subtitle1,
          )),
      backgroundColor: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width * 0.8,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(sn);
  }

  Future<ui.Image> getImageFromPath(String imagePath) async {
    File imageFile = File(imagePath);

    Uint8List imageBytes = imageFile.readAsBytesSync();

    final Completer<ui.Image> completer = new Completer();

    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }

  String getDateStay(String date) {
    DateTime datet = DateTime.parse(date);
    Duration dur = datet.difference(DateTime.now());
    int difinday = (dur.inDays).floor();
    int difinhour = (dur.inHours).floor();
    int difinminut = (dur.inMinutes).floor();

    if (difinday == 0) {
      int minut;
      minut = difinhour == 0 ? difinminut : difinhour % 60;

      return difinhour == 0 ? "متبقي $minut دقيقة" : "متبقي $difinhour ساعة";
    } else if (difinday > 0) {
      return "متبقي $difinday يوم";
    } else {
      return "منتهي";
    }
  }

  bool dispNotfi(String date) {
    DateTime datet = DateTime.parse(date);
    Duration dur = DateTime.now().difference(datet);
    int difinday = (dur.inDays).floor();
    int difinhour = (dur.inHours).floor();
    int difinminut = (dur.inMinutes).floor();

    if (difinday == 0) {
      int minut;
      minut = difinhour == 0 ? difinminut : difinhour % 60;

      return difinhour > 0
          ? true
          : minut > 0 && difinhour == 0
              ? true
              : false;
    } else if (difinday > 0) {
      return true;
    } else {
      return false;
    }
  }

  int getNumOfdays(String date) {
    DateTime datet = DateTime.parse(date);
    Duration dur = datet.difference(DateTime.now());
    int difinday = (dur.inDays).floor();
    int difinhour = (dur.inHours).floor();
    int difinminut = (dur.inMinutes).floor();

    return difinday;
  }

  String getPrice(int price, Locale locale) {
    if (price > 1000000) {
      String price1 = (price / 1000000).toString();
      String ext = locale == Locale("ar") ? " مليون د.ع" : "M IQD";
      return price1.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match m) => '${m[1]},') +
          ext;
    } else {
      String ext = locale == Locale("ar") ? "  د.ع" : " IQD";
      return price.toString().replaceAllMapped(
              new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match m) => '${m[1]},') +
          ext;
    }
  }

  String getTitle(String title) {
    return title.length > 20 ? "${title.substring(0, 17)} ..." : title;
  }

  String getTimeText(String timeTo) {
    List<int> timeto = timeTo.split(":").map(int.parse).toList();

    String time1;
    String time2;

    String b = timeto[1] < 10 ? "0" : " ";
    if (timeto[0] < 12) {
      time2 = "${timeto[1]} : $b${timeto[0]}  ص";
    } else if (timeto[0] == 12) {
      time2 = "${timeto[1]} : $b${timeto[0]} م";
    } else {
      time2 = "${timeto[1]} : $b${timeto[0] - 12} م";
    }

    return time2;
  }

  String getDayName(int day) {
    List<String> days = [
      "الاثنين",
      "الثلاثاء",
      "الاربعاء",
      "الخميس",
      "الجمعة",
      "السبت",
      "الاحد"
    ];
    return days[day - 1];
  }

  bool phoneValidate(String value) {
    RegExp exp = RegExp(r'^[0-9]+$');
    bool matches = exp.hasMatch(value);

    return value.length > 10 && value.length < 12 ? matches : false;
  }

//  Future<Marker>  addMarker(LatLng latLng,String title ,String subtit, BitmapDescriptor pin)  async {//add marker on tap
//   final http.Response response = await http.get("https://cdn.iconscout.com/icon/premium/png-512-thumb/map-pin-1473766-1249535.png");

//            return Marker(markerId: MarkerId(latLng.toString()),
//               position: latLng,
//               infoWindow: InfoWindow(title: title,snippet: subtit),
//               icon: BitmapDescriptor.fromBytes(response.bodyBytes));

//           }
//           String getLang(){

//             String lang =ui.window.locale.languageCode;

// return lang;
//           }

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String getduration(int time) {
    var h = time / 60;
    var m = time % 60;
    return "";
  }

  gettime(int dur) {
    return timeFormatter(dur);
  }

  String timeFormatter(int time) {
    Duration duration = Duration(milliseconds: time);

    return [duration.inHours, duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  static String getDuratuin(e) {
    if (e == null) {
      return "";
    } else {
      TimeOfDay durationDate =
          TimeOfDay(minute: e % 60, hour: (e / 60).toInt());

      String h = durationDate.hour > 0 ? "${durationDate.hour}h " : "";
      String d = durationDate.hour > 0 && durationDate.minute > 0 ? " " : "";
      String m = durationDate.minute > 0 ? "${durationDate.minute}min " : "";
      String duration = h + d + m;
      return duration;
    }
  }

  static String getTime(String time) {
    var myDate = DateFormat('y-MM-d').parse(time);
    String w = DateFormat.EEEE("ar").format(myDate);
    String d = DateFormat.d("ar").format(myDate);
    String m = DateFormat.MMM("ar").format(myDate);
    String y = DateFormat.y("ar").format(myDate);

    return "$w $d $m $y";
  }

  String toHex(Color color, {bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : ''}'
      '${color.red.toRadixString(16).padLeft(2, '0')}'
      '${color.green.toRadixString(16).padLeft(2, '0')}'
      '${color.blue.toRadixString(16).padLeft(2, '0')}';
}
