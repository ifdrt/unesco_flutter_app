import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:provider/provider.dart';
import 'package:unesco/Widget/button_outline.dart';
import 'package:unesco/Widget/image_widget.dart';
import 'package:unesco/bussines_logic/home_bloc/home_bloc_b.dart';
import 'package:unesco/data/Model/home_model.dart';
import 'package:unesco/data/dataProvider/func.dart';
import 'package:unesco/data/dataProvider/main_info.dart';
import 'package:unesco/utlils/TextResponsive.dart';
import 'package:url_launcher/url_launcher.dart';

import 'news/news_details_view.dart';
import 'slid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool first = true;

  @override
  Widget build(BuildContext context) {
    if (first) {
      print("23o993 ====continus");
      if (BlocProvider.of<HomeBloc>(context).state is! HomeBlocLoaded) {
        BlocProvider.of<HomeBloc>(context).add(GetHomeData());
      }

      first = false;
    }
    return BlocBuilder<HomeBloc, HomeBlocState>(
      builder: (context, s) {
        return s is HomeBlocLoding
            ? Center(
                child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).accentColor,
                      ),
                    )),
              )
            : s is HomeBlocLoaded
                ? Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 5,
                        itemBuilder: (c, i) {
                          return i == 0
                              ? s.homeModel != null &&
                                      s.homeModel.slidersModel != null
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: Slideshow(
                                        slider: s.homeModel.slidersModel!,
                                      ),
                                    )
                                  : Text("data")
                              : i == 1
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: s.homeModel.articlesModel!
                                          .map((e) => NewsCard(e))
                                          .toList())
                                  : i == 2
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, right: 15),
                                              child: Text(
                                                "من نحن",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .accentColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            ListTile(
                                              title: Text(s.homeModel
                                                  .aboutsModel!.title!),
                                              subtitle: Text(s
                                                  .homeModel
                                                  .aboutsModel!
                                                  .longDescription!),
                                            ),
                                          ],
                                        )
                                      : i == 3
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                  Divider(),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10, right: 15),
                                                    child: Text(
                                                      "اهداف المنصة",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1!
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ),
                                                  Column(
                                                      children: s.homeModel
                                                          .purposesModel!
                                                          .map((e) => Card(
                                                                  child:
                                                                      Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: ListTile(
                                                                  title: Text(
                                                                    e.title!,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  subtitle: Text(
                                                                      e.desciption!),
                                                                ),
                                                              )))
                                                          .toList())
                                                ])
                                          : const SizedBox(
                                              height: 200,
                                            );
                        }),
                  )
                : InkWell(
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
                  );
      },
    );
  }
}

class NewsCard extends StatelessWidget {
  late ArticlesModel data;
  NewsCard(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3),
                            topRight: Radius.circular(3)),
                        child: Image(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(data.photo!)))),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  color: Theme.of(context).cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          Funct.getTime(data.createdAt!),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        subtitle: Text(
                          data.shortDescription!,
                          style: Theme.of(context).textTheme.subtitle1!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          " اسم الناشر : Sajjad Asaad",
                          style: Theme.of(context).textTheme.bodyText1,
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
                              width: 80,
                              height: 30,
                              title: "اقراء المزيد",
                              onTapp: () async {
                                await launch(
                                    "https://ifdrt.iq/news/${data.slug}");
                                // showCupertinoModalBottomSheet(
                                //     context: context,
                                //     builder: (c) {
                                //       return NewsDetailsView(data: data);
                                //     });
                              },
                              color: Theme.of(context).accentColor),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
