import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertMess {
  AlertMess.showM(
      {required String title,
      required String msg,
      Icon? icon,
      required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Wrap(
            children: <Widget>[
              ListTile(
                trailing: icon != null ? icon : null,
                title: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 18),
                ),
                subtitle: Text(
                  msg != null ? msg : "لا توجد ",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).accentColor,
                child: TextButton(
                  child: Text(
                    "الغاء",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 13),
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
