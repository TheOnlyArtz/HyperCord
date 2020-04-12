import 'package:flutter/material.dart';
import 'package:hyper_cord/Pages/MainPage.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(39, 46, 72, 1),
      ),
      home: MainPage(),
    );
  }
}



