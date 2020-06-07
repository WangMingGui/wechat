
import 'package:flutter/material.dart';
import 'package:wechatapp/root_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Color.fromRGBO(1, 1, 1, 0),
        splashColor: Color.fromRGBO(1, 1, 1, 0),
//        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootPageState(),
    );
  }
}

