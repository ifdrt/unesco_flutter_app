import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:provider/provider.dart';
import 'package:unesco/Widget/button_outline.dart';
import 'package:unesco/Widget/image_widget.dart';
import 'package:unesco/bussines_logic/home_bloc/home_bloc_b.dart';
import 'package:unesco/data/dataProvider/main_info.dart';

import 'home.dart';
import 'slid_view.dart';

class ActivityView extends StatefulWidget {
  @override
  _ActivityView createState() => _ActivityView();
}

class _ActivityView extends State<ActivityView> {
  bool first = true;

  @override
  Widget build(BuildContext context) {
    if (first) {
      print("23o993 ====continus");
      // if (BlocProvider.of<HomeBloc>(context).state is! HomeBlocLoaded) {

      // }

      first = false;
    }
    return BlocBuilder<HomeBloc, HomeBlocState>(
      builder: (context, s) {
        return s is HomeBlocLoding
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).accentColor,
                    )),
              ])
            : s is HomeBlocLoaded
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        itemBuilder: (c, i) {
                          return Stack(
                            children: [
                              Card(
                                margin: EdgeInsets.only(top: 20),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 8, right: 9),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            width: 2,
                                            height: 30,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            FontAwesomeIcons.clipboard,
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "اقامة ندوة صحافية",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "اقامة ندوة صحافية اقامة ندوة صحافية اقامة ندوة صحافية اقامة ندوة صحافية اقامة ندوة صحافية اقامة ندوة صحافية",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(CupertinoIcons.share)),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(CupertinoIcons.star)),
                                          Spacer(),
                                          ButtonOutline(
                                              width: 90,
                                              height: 30,
                                              title: "اقراء المزيد",
                                              onTapp: () {},
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color!),
                                          SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 15,
                                  top: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(3)),
                                    width: 60,
                                    child: ListTile(
                                      dense: true,
                                      title: Text(
                                        "05",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        textAlign: TextAlign.center,
                                      ),
                                      subtitle: Text(
                                        "يناير",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ))
                            ],
                          );
                        }),
                  )
                : s is HomeBlocError
                    ? InkWell(
                        onTap: () {
                          BlocProvider.of<HomeBloc>(context).add(GetHomeData());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "An error has occured",
                              style: Theme.of(context).textTheme.headline1,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Please check your connection and try again",
                              style: Theme.of(context).textTheme.subtitle1,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    : SizedBox();
      },
    );
  }

  Widget dataView(List<String> items, BuildContext context) {
    return Container(
      height:
          (MediaQuery.of(context).size.height - AppBar().preferredSize.height) -
              100,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        top: false,
        child: GridView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 2 / 3),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: InkWell(
                  onTap: () async {},
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Img(
                        size: 30,
                        url: items[index],
                      )),
                ));
          },
        ),
      ),
    );
  }
}

class HorizonalyListvew extends StatelessWidget {
  const HorizonalyListvew({
    Key? key,
    required this.arr,
  }) : super(key: key);

  final List<String> arr;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: (MediaQuery.of(context).size.width * 0.25 * 1.8),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 10),
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: arr.map((e) {
              return InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ActivityView())),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Img(
                                  size: 50,
                                  url: e,
                                ),
                              )),
                        ],
                      )),
                ),
              );
            }).toList()),
      ),
    );
  }
}
