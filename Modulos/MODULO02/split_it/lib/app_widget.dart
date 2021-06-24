import 'package:flutter/material.dart';
import 'package:split_it/modulos/login/login_page.dart';

import 'modulos/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'split.it',
      home: LoginPage(),
    );
  }
}
