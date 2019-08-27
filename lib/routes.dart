import 'package:flutter/material.dart';
import 'screens/auth/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/Auth': (BuildContext context) => new AuthScreen()
  };

  Routes() {
    runApp(new MaterialApp(
      title: "Demo",
      routes: routes,
      home: new AuthScreen(),
    ));
  }
}