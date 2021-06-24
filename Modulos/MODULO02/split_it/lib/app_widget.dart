import 'package:flutter/material.dart';
import 'package:split_it/modulos/error/error_page.dart';
import 'package:split_it/modulos/home/home_page.dart';
import 'package:split_it/modulos/login/login_page.dart';
import 'modulos/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Split.it',
      home: SplashPage(),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/error": (context) => ErrorPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
