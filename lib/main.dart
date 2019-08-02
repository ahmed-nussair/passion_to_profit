import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/splash.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Passion to Profit',
        routes: <String, WidgetBuilder>{
          '/Home': (BuildContext context) => Home(),
          '/Login': (BuildContext context) => Login(),
        },
        home: SplashScreen(),
      )
  );
}