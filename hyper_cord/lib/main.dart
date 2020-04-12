import 'package:flutter/material.dart';
import 'package:hyper_cord/Elements/HyperCordNavBar.dart';
import 'package:hyper_cord/Pages/MainPage.dart';


void main() => runApp(Pages());

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  void initState() {
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(39, 46, 72, 1),
      ),
      
      home: HyperCordNavBar()
      // home: MainPage(),
    );
  }
}

