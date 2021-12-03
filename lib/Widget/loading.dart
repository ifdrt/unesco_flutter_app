import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Loading_logo extends StatefulWidget {
  double size;
  Loading_logo({this.size = 80});
  @override
  _LoadingLogo createState() => _LoadingLogo();
}

class _LoadingLogo extends State<Loading_logo> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool first = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.size / 2),
      ),
      child: Container(
        height: widget.size,
        width: widget.size,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.size / 2),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).primaryColor.withOpacity(0.2),
              ]
// colors: [Theme.of(context).accentColor,Theme.of(context).accentColor],

              ),
          //       boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 3,
          //     blurRadius: 7,
          //     offset: Offset(0, 3), // changes position of shadow
          //   ),
          // ],
        ),
        child: Image.asset(
          "images/logo.png",
          scale: 3,
        ),
      ),
    );
  }
}
