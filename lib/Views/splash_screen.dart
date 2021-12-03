import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:unesco/app.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  go() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => App()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    go();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          // Positioned(
          //     left: 10,
          //     right: 10,
          //     bottom: MediaQuery.of(context).size.height * 0.25,
          //     child: Text(
          //       "منصة الإبلاغ الرقمية للصحفيات النساء",
          //       style: Theme.of(context).textTheme.headline4,
          //       textAlign: TextAlign.center,
          //     ))
        ],
      ),
    );
  }
}
