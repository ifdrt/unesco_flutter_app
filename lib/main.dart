import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:unesco/Provider/navigator_provide.dart';
import 'package:unesco/Views/splash_screen.dart';
import 'package:unesco/bussines_logic/home_bloc/home_bloc_b.dart';
import 'package:unesco/bussines_logic/news_bloc/news_bloc.dart';
import 'package:unesco/bussines_logic/submit_bloc/submit_bloc_b.dart';
import 'Builder/theme_builder.dart';
import 'Provider/theme_provider.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();

  Hive..init(appDocumentDir.path);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<NavigateProv>(create: (_) => NavigateProv()),
          ChangeNotifierProvider<ThemeUtils>(
              create: (_) => ThemeUtils(themeBuilder(1))),
          ChangeNotifierProvider<NavigateProv>(create: (_) => NavigateProv()),
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(),
          ),
          BlocProvider<NewsBloc>(
            create: (BuildContext context) => NewsBloc(),
          ),
          BlocProvider<SubmitBloc>(
            create: (BuildContext context) => SubmitBloc(),
          ),
        ], child: MainView()));
  }
}

class MainView extends StatelessWidget {
  bool first = true;
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeUtils>(context);
    if (first) {
      theme.getstatusRequest(context);
      first = false;
    }
    return MaterialApp(
        localizationsDelegates: const [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,

          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'), // Hebrew
          // Chinese *See Advanced Locales below*
          // ... other locales the app supports
        ], // Chinese *See Advanced
        locale: const Locale("ar"),
        themeMode: ThemeMode.system,
        theme: themeBuilder(1),
        darkTheme: themeBuilder(0),
        title: 'unisco',
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
