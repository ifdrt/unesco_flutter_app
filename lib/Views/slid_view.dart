import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unesco/Widget/image_widget.dart';
import 'package:unesco/data/Model/home_model.dart';

class Slideshow extends StatefulWidget {
  late List<SlidersModel> slider;
  Slideshow({required this.slider});
  @override
  _SlideshowState createState() => _SlideshowState();
}

class _SlideshowState extends State<Slideshow> {
  PageController pageController = new PageController();
  var currentPageValue = 0.0;
  int page = 0;
  String id = "";
  Timer? timer;

  startTimeout() {
    var duration = Duration(seconds: 4);
    timer = new Timer.periodic(duration, (s) {
      setState(() {
        try {
          page++;
          currentPageValue = page.toDouble();
          id = widget.slider[page % widget.slider.length].id.toString();
        } catch (e) {}
      });

      pageController.animateToPage(page,
          duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    });

    return timer;
  }

  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        setState(() {
          page = pageController.page!.toInt();
        });
      });
    startTimeout();
  }

  @override
  void dispose() {
    timer != null ? timer!.cancel() : null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void deactivate() {
    timer != null ? timer!.cancel() : null;
    super.deactivate();
  }

  bool first = true;

  double pageOffset = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        return Container(
            padding: EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 10),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => DetailsView(
                //               posterImg: widget
                //                   .topModel
                //                   .items[index % widget.topModel.items.length]
                //                   .poster,
                //               typeVideo: widget
                //                           .topModel
                //                           .items[index %
                //                               widget.topModel.items.length]
                //                           .type ==
                //                       "movie"
                //                   ? 1
                //                   : 2,
                //               id: widget
                //                   .topModel
                //                   .items[index % widget.topModel.items.length]
                //                   .id,
                //               title: widget
                //                   .topModel
                //                   .items[index % widget.topModel.items.length]
                //                   .name,
                //             )));
              },
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ])),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            child:
                                // Image.network(widget
                                //   .topModel[index % widget.topModel.items.length].poster,)

                                Img(
                              placeholder: SizedBox(),
                              url: widget
                                  .slider[index % widget.slider.length].photo!,
                              size: 100,
                              boxFit: BoxFit.fill,
                            ),
                          )),
                      // Container(
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //           begin: Alignment.bottomCenter,
                      //           end: Alignment.topCenter,
                      //           colors: [Colors.black, Colors.transparent])),
                      // ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.transparent,
                              Theme.of(context).scaffoldBackgroundColor
                            ])),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 10,
                          right: 10,
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 0, left: 0, right: 0),
                                    title: Text(
                                      widget
                                          .slider[index % widget.slider.length]
                                          .title!,
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ],
                              ))),
                    ],
                  )),
            ));
      },
    );
    // :Center(child: SpinKitCircle(color: Theme.of(context).accentColor,),);
  }
}
