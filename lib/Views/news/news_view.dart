import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';
import 'package:unesco/bussines_logic/home_bloc/home_bloc_b.dart';
import 'package:unesco/bussines_logic/news_bloc/news_bloc.dart';
import 'package:unesco/data/dataProvider/main_info.dart';

import '../home.dart';
import '../slid_view.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsView createState() => _NewsView();
}

class _NewsView extends State<NewsView> {
  bool first = true;

  @override
  Widget build(BuildContext context) {
    if (first) {
      if (BlocProvider.of<NewsBloc>(context).state is! NewsBlocLoaded) {
        BlocProvider.of<NewsBloc>(context).add(GetNewsData());
      }

      first = false;
    }
    return BlocBuilder<NewsBloc, NewsBlocState>(builder: (context, s) {
      return s is NewsBlocLoding
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
          : s is NewsBlocLoaded
              ? Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: s.newsModel.dataNews!.length,
                      itemBuilder: (c, i) {
                        return i == s.newsModel.dataNews!.length - 1
                            ? Column(
                                children: [
                                  NewsCard(s.newsModel.dataNews![i]),
                                  SizedBox(
                                    height: 200,
                                  )
                                ],
                              )
                            : NewsCard(s.newsModel.dataNews![i]);
                      }),
                )
              : InkWell(
                  onTap: () {
                    BlocProvider.of<NewsBloc>(context).add(GetNewsData());
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
    });
  }
}
