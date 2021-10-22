import 'package:flutter/material.dart';
import 'package:islami_fri/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        HomePage.routeName: (buildContext) => HomePage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
