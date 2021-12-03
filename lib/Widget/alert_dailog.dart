import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDilogg {
  AlertDilogg.showM(
      {required String title,
      required String msg,
      required Icon icon,
      required BuildContext context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Theme.of(context).cardColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
                height: 260,
                padding:
                    EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: icon != null
                              ? icon
                              : Icon(
                                  Icons.info,
                                  size: 30,
                                )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        msg,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Row(children: [
                          Expanded(
                            child: RaisedButton(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "تم",
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                            ),
                          )
                        ])),
                  ],
                )),
          );
        });
  }
}
