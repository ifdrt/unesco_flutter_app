import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unesco/Widget/image_widget.dart';
import 'package:unesco/bussines_logic/home_bloc/home_bloc_b.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUs createState() => _AboutUs();
}

class _AboutUs extends State<AboutUs> {
  bool first = true;

  @override
  Widget build(BuildContext context) {
    if (first) {
      print("23o993 ====continus");
      // if (BlocProvider.of<HomeBloc>(context).state is! HomeBlocLoaded) {

      // }

      first = false;
    }
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          " من نحن",
          style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        Text(
          "نحن منصة الإبلاغ الرقمية للصحفيات النساء",
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        ClipRRect(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Img(
                url:
                    "https://ifdrt.iq/storage/abouts/September2021/dTEn6auPOrdlJIx0oQVK.jpg",
                size: 50),
          ),
        ),
        Text(
          "غاية المنصة",
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "ان هذه المنصة بمثابة حلقة وصل بين الصحفيات العراقيات واللجنة الوطنية العراقية لسلامة الصحفيين ومكافحة الإفلات من العقاب، وهي خطوة أولى من ضمن عدد من الخطوات التي يتم العمل عليها حاليا لتحقيق مسالة حكومية للجرائم والمخاطر والتهديدات التي تتعرض لها هذه الفئة. وتتلخص الغاية من انشاء المنصة في النقاط التالية:",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        BlocBuilder<HomeBloc, HomeBlocState>(builder: (c, s) {
          return s is HomeBlocLoaded
              ? Column(
                  children: s.homeModel.purposesModel!
                      .map((e) => Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).accentColor,
                                    Theme.of(context).primaryColor
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                e.title!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              subtitle: Text(
                                e.desciption!,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          )))
                      .toList())
              : SizedBox();
        })
      ]),
    ));
  }
}
