import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:unesco/Views/about.dart';
import 'package:unesco/Views/activity_view.dart';
import 'package:unesco/Views/contact_us.dart';
import 'package:unesco/Views/develop_view.dart';
import 'package:unesco/Views/complaints_view.dart';
import 'package:unesco/Views/news/news_view.dart';

import 'Provider/navigator_provide.dart';
import 'Provider/theme_provider.dart';
import 'Views/home.dart';
import 'data/dataProvider/main_info.dart';

class App extends StatefulWidget {
  @override
  _Appstate createState() => _Appstate();
}

class _Appstate extends State<App> {
  bool first = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Intl.defaultLocale = 'ar';
  }

  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final navigatProv = Provider.of<NavigateProv>(context);
    final theme = Provider.of<ThemeUtils>(context);
    if (first) {
      navigatProv.navigateView(HomePage(), 0, "title1");

      first = false;
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: key,
      appBar: CustomAppBar(onTapmenu: () => key.currentState!.openDrawer()),
      body: navigatProv.view,
      drawer: theme.status == 1 ? DarwerMenu() : null,
      bottomNavigationBar: _buildBottomNavigation(context, navigatProv, theme),
    );
  }

  Widget _buildBottomNavigation(
      BuildContext context, NavigateProv navigatProv, ThemeUtils theme) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
        child: GNav(
            selectedIndex: navigatProv.selctedIndex,
            onTabChange: (index) {
              switch (index) {
                case 0:
                  navigatProv.navigateView(
                      HomePage(), index, "dataProv.trans.home");

                  break;
                case 1:
                  navigatProv.navigateView(
                      NewsView(), index, "dataProv.trans.home");

                  break;
                case 2:
                  navigatProv.navigateView(
                      ActivityView(), index, "dataProv.trans.home");

                  break;
                case 3:
                  navigatProv.navigateView(
                      ShakwaView(), index, "dataProv.trans.home");

                  break;

                default:
              }
            },
            textStyle: Theme.of(context).textTheme.bodyText2,
            rippleColor:
                Colors.grey[800]!, // tab button ripple color when pressed
            hoverColor: Colors.grey[700]!, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 200), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey, // unselected icon color
            activeColor: Colors.white, // selected icon and text color
            iconSize: 25, // tab button icon size
            tabBackgroundColor:
                Theme.of(context).accentColor, // selected tab background color
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 10), // navigation bar padding
            tabs: [
              GButton(
                icon: EvaIcons.home,
                text: 'الرئيسية',
              ),
              GButton(
                icon: FontAwesomeIcons.newspaper,
                text: 'الاخبار',
              ),
              GButton(
                icon: EvaIcons.activity,
                text: 'النشاطات',
              ),
              GButton(
                icon: FontAwesomeIcons.clipboard,
                text: getstring(theme),
              )
            ]),
      ),
    );
  }

  // Widget buildClipRRect(BuildContext context ,DataProvider dataProv,NavigateProv navigatProv) {
  String getstring(ThemeUtils theme) {
    return theme.status == 0 ? 'المزيد' : 'الشكاوي';
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}

class DarwerMenu extends StatelessWidget {
  const DarwerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigatProv = Provider.of<NavigateProv>(context);
    final theme = Provider.of<ThemeUtils>(context);
    return Drawer(
        semanticLabel: "unisco",
        child: SafeArea(
          top: false,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  color: Theme.of(context).canvasColor,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 20, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"))),
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
                Expanded(
                    flex: 8,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Container(
                            color: navigatProv.selctedIndex == 0
                                ? Theme.of(context).accentColor.withOpacity(0.5)
                                : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                navigatProv.navigateView(
                                    HomePage(), 0, "dataProv.trans.home");
                                Navigator.pop(context);
                              },
                              leading: Icon(EvaIcons.home),
                              dense: true,
                              title: Text(
                                "الرئيسية",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            )),
                        Container(
                            color: navigatProv.selctedIndex == 1
                                ? Theme.of(context).accentColor.withOpacity(0.5)
                                : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                navigatProv.navigateView(
                                    NewsView(), 1, "dataProv.trans.home");
                                Navigator.pop(context);
                              },
                              leading: Icon(FontAwesomeIcons.newspaper),
                              dense: true,
                              title: Text(
                                "الاخبار ",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            )),
                        Container(
                            color: navigatProv.selctedIndex == 2
                                ? Theme.of(context).accentColor.withOpacity(0.5)
                                : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                navigatProv.navigateView(
                                    ActivityView(), 2, "dataProv.trans.home");
                                Navigator.pop(context);
                              },
                              leading: Icon(FontAwesomeIcons.clipboard),
                              dense: true,
                              title: Text(
                                "النشاطات",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            )),
                        Container(
                            color: navigatProv.selctedIndex == 3
                                ? Theme.of(context).accentColor.withOpacity(0.5)
                                : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                navigatProv.navigateView(
                                    ShakwaView(), 3, "dataProv.trans.home");
                                Navigator.pop(context);
                              },
                              leading: Icon(FontAwesomeIcons.infoCircle),
                              dense: true,
                              title: Text(
                                theme.status == 1 ? "الابلاغ" : "المزيد",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            )),
                        Container(
                            color: navigatProv.selctedIndex == 4
                                ? Theme.of(context).accentColor.withOpacity(0.5)
                                : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                navigatProv.navigateView(
                                    DevelopView(), 4, "dataProv.trans.home");
                                Navigator.pop(context);
                              },
                              leading: Icon(FontAwesomeIcons.chartLine),
                              dense: true,
                              title: Text(
                                "التطوير و التاهيل",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            )),
                        Container(
                            color: navigatProv.selctedIndex == 5
                                ? Theme.of(context).accentColor.withOpacity(0.5)
                                : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                navigatProv.navigateView(
                                    AboutUs(), 5, "dataProv.trans.home");
                                Navigator.pop(context);
                              },
                              leading: Icon(FontAwesomeIcons.addressCard),
                              dense: true,
                              title: Text(
                                "من نحن",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            )),
                        Container(
                            color: navigatProv.selctedIndex == 6
                                ? Theme.of(context).accentColor.withOpacity(0.5)
                                : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                navigatProv.navigateView(
                                    ContactUs(), 6, "dataProv.trans.home");
                                Navigator.pop(context);
                              },
                              leading: Icon(FontAwesomeIcons.phone),
                              dense: true,
                              title: SelectableText(
                                "اتصل بنا",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            )),
                      ],
                    )),
                Spacer(),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectableText(
                    "الدعم الفني : info@ifdrt.iq",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final Size preferredSize;
  void Function() onTapmenu;
  CustomAppBar({required this.onTapmenu})
      : preferredSize = Size.fromHeight(70.0);
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeUtils>(context);
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: ListTile(
          title: Text(
            Info.appName,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          leading: theme.status == 1
              ? IconButton(
                  onPressed: () {
                    widget.onTapmenu();
                  },
                  icon: Icon(
                    EvaIcons.menu,
                    color: Colors.white,
                    size: 35,
                  ))
              : null,
        ),
      ),
    );
  }
}
