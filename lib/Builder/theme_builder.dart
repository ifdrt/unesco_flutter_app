import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ThemeData themeBuilder(int a) {
  double big = 18;
  double mid = 14;
  double sm = 12;
  double vsm = 10;
  final ThemeData base = a == 0
      ? ThemeData.dark()
      : a == 1
          ? ThemeData.light()
          : ThemeData.dark();

  TextTheme _txtTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1?.copyWith(
          color: Colors.white, fontFamily: 'Ku', height: 1.5, fontSize: big),
      headline2: base.headline2?.copyWith(
          color: Colors.black, fontFamily: 'Ku', height: 1.5, fontSize: big),
      headline3: base.headline3?.copyWith(
          color: Colors.black,
          fontFamily: 'Ku',
          fontSize: mid,
          fontWeight: FontWeight.bold),
      headline4: base.headline4?.copyWith(
          color: Color(0xff896eff),
          fontFamily: 'Ku',
          fontSize: big,
          fontWeight: FontWeight.w900),
      headline5: base.headline4?.copyWith(
          color: Color(0xff896eff),
          fontFamily: 'Ku',
          fontSize: sm,
          fontWeight: FontWeight.w900),
//for smal title

      headline6: base.headline3?.copyWith(
          color: Colors.white,
          fontFamily: 'Ku',
          height: 1.5,
          fontSize: sm,
          fontWeight: FontWeight.normal),
      subtitle1: base.subtitle1?.copyWith(
        color: Colors.black,
        fontFamily: 'Ku',
        height: 1.5,
        fontWeight: FontWeight.bold,
        fontSize: mid,
      ),
      subtitle2: base.subtitle2?.copyWith(
        color: Colors.white,
        fontFamily: 'Ku',
        height: 1.5,
        fontWeight: FontWeight.bold,
        fontSize: mid,
      ),
      bodyText1: base.bodyText1?.copyWith(
          color: Colors.grey[600],
          fontFamily: 'Ku',
          height: 1.5,
          fontSize: sm,
          fontWeight: FontWeight.normal),
      bodyText2: base.bodyText2?.copyWith(
          color: Colors.white,
          fontFamily: 'Ku',
          height: 1.5,
          fontSize: sm,
          fontWeight: FontWeight.normal),

      button: base.bodyText1?.copyWith(
          color: Colors.white,
          fontFamily: 'Ku',
          height: 1.5,
          fontSize: sm,
          fontWeight: FontWeight.normal),
    );
  }

  TextTheme _txtThemeD(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1?.copyWith(
          color: Colors.white, fontFamily: 'Ku', height: 1.5, fontSize: big),
      headline2: base.headline2?.copyWith(
          color: Colors.white, fontFamily: 'Ku', height: 1.5, fontSize: big),
      headline3: base.headline3?.copyWith(
          color: Colors.white,
          fontFamily: 'Ku',
          fontWeight: FontWeight.bold,
          fontSize: mid),
      headline4: base.headline4?.copyWith(
          color: Colors.grey[200],
          fontFamily: 'Ku',
          fontWeight: FontWeight.bold,
          fontSize: big),
      headline5: base.headline4?.copyWith(
          color: Colors.grey[200],
          fontFamily: 'Ku',
          fontSize: sm,
          fontWeight: FontWeight.w900),
      subtitle1: base.subtitle1?.copyWith(
        color: Colors.white,
        fontFamily: 'Ku',
        height: 1.5,
        fontSize: mid,
      ),
      subtitle2: base.subtitle2?.copyWith(
        color: Colors.white,
        fontFamily: 'Ku',
        fontSize: mid,
      ),
      bodyText1: base.bodyText1?.copyWith(
        color: Colors.grey[300],
        fontFamily: 'Ku',
        height: 1.5,
        fontSize: sm,
      ),
      bodyText2: base.bodyText2?.copyWith(
          color: Colors.white,
          fontFamily: 'Ku',
          height: 1.5,
          fontSize: sm,
          fontWeight: FontWeight.normal),
      button: base.bodyText1?.copyWith(
        color: Colors.white,
        fontFamily: 'Ku',
        height: 1.5,
        fontSize: sm,
      ),
    );
  }

  TextTheme _txtThemec(TextTheme base) {
    return base.copyWith(
      button: base.button?.copyWith(
          color: Colors.white,
          fontFamily: 'Ku',
          height: 1.5,
          fontSize: mid,
          fontWeight: FontWeight.normal),
      headline1: base.headline1?.copyWith(
          color: Colors.white, fontFamily: 'Ku', height: 1.5, fontSize: big),
      headline2: base.headline2?.copyWith(
          color: Colors.black, fontFamily: 'Ku', height: 1.5, fontSize: big),
      subtitle1: base.subtitle1?.copyWith(
        color: Colors.black,
        fontFamily: 'Ku',
        height: 1.5,
        fontSize: 16,
      ),
      subtitle2: base.subtitle2?.copyWith(
        color: Colors.white,
        fontFamily: 'Ku',
        height: 1.5,
        fontSize: 16,
      ),
      bodyText1: base.bodyText1?.copyWith(
          color: Colors.grey[500],
          fontFamily: 'Ku',
          height: 1.5,
          fontSize: sm,
          fontWeight: FontWeight.normal),
      bodyText2: base.bodyText2?.copyWith(
          color: Colors.white,
          fontFamily: 'Ku',
          height: 1.5,
          fontSize: sm,
          fontWeight: FontWeight.normal),
    );
  }

  return a == 0
      ? base.copyWith(
          textTheme: _txtThemeD(base.textTheme),
          primaryColor: Color(0xff141414),
          scaffoldBackgroundColor: Color(0xff0A0A0A),
          cardColor: Color(0xff141414),
          backgroundColor: Color(0x44856FF7),
          buttonTheme: ButtonThemeData(
              height: 45,
              padding: EdgeInsets.only(left: 15, right: 15),
              minWidth: big,
              buttonColor: Color(0xff896eff)),
          tabBarTheme: base.tabBarTheme.copyWith(
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Ku',
                  height: 1.5,
                  fontSize: mid),
              unselectedLabelStyle: TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Ku',
                  height: 1.5,
                  fontSize: sm)),
          canvasColor: Color(0xff323333),
          accentColor: Color(0xff00A8B8),
          indicatorColor: Color(0xff896eff),
          bottomAppBarColor: Colors.black)
      : a == 1
          ? base.copyWith(
              textTheme: _txtTheme(base.textTheme),
              brightness: Brightness.dark,
              primaryColor: Color(0xff896eff),
              scaffoldBackgroundColor: Color(0xffF8F8FE),
              appBarTheme: AppBarTheme(
                elevation: 20,
                centerTitle: true,
                titleTextStyle: _txtTheme(base.textTheme).headline1,
              ),
              accentColor: Color(0xff47BEE2),
              // colorScheme: ColorScheme(primary: Color(0xff896eff), primaryVariant: Color(0xff896eff),
              //  secondary: Color(0xff47BEE2), secondaryVariant: Color(0xff47BEE2),
              //   surface: Color(0xffF8F8FE), background: Color(0xffF8F8FE), error: Colors.red,
              //    onPrimary: onPrimary, onSecondary: onSecondary, onSurface: onSurface, onBackground: onBackground, onError: onError, brightness: brightness),
              // // Color(0xffffabig0),
              //bottom bar
              canvasColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.grey, size: big),
              indicatorColor: Color(0xff896eff),
              bottomAppBarColor: Colors.black,
              backgroundColor: Color(0xff896eff),
              buttonColor: Color(0xff47BEE2),
              cardColor: Colors.white,
              hintColor: Colors.grey,
              buttonTheme: ButtonThemeData(
                height: big,
                padding: EdgeInsets.all(2),
                minWidth: big,
                textTheme: ButtonTextTheme.primary,
              ),
              tabBarTheme: base.tabBarTheme.copyWith()
              //blue dark color
              )
          : base.copyWith(
              textTheme: _txtTheme(base.textTheme),
              primaryColor: Color(0xff2d248a),
              indicatorColor: Colors.white,
              scaffoldBackgroundColor: Color(0xffF2F4F6),
              accentColor: Color(0xffe42c64),
              //bottom bar
              canvasColor: Colors.white,
              cardColor: Colors.amber,
              hintColor: Colors.black,
              buttonTheme: ButtonThemeData(
                  height: big,
                  padding: EdgeInsets.all(2),
                  minWidth: big,
                  buttonColor: Color(0xff616ad3),
                  textTheme: ButtonTextTheme.primary),
              tabBarTheme: base.tabBarTheme.copyWith(
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ku',
                      height: 1.5,
                      fontSize: mid),
                  unselectedLabelStyle: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Ku',
                      height: 1.5,
                      fontSize: sm))
              //blue dark color
              );
}
