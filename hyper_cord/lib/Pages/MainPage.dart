import 'package:flutter/material.dart';
import 'package:hyper_cord/Elements/HyperCordBar.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: CustomScrollView(
        slivers: <Widget>[
          HyperCordBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 800,
              )
            ]),
          )
        ],
      ),
    );
  }
}