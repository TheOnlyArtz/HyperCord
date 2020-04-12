import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hyper_cord/Elements/HyperCordAppBar.dart';
import 'package:hyper_cord/Elements/MainPagePost.dart';
import 'package:hyper_cord/Elements/HyperCordNavBar.dart';

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
      floatingActionButton:
          IconButton(icon: Icon(FontAwesomeIcons.plus), onPressed: () {}),
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          HyperCordBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              MainPagePost("Valorant - משחק חדש שמפציץ בצופים!", "21/04/2020",
                  "גיימינג", "assets/images/valorant.jpg"),
              MainPagePost("סוני מפרסמת את השלט החדש לסוני 5!", "21/04/2020",
                  "גיימינג", "assets/images/valorant.jpg"),
              MainPagePost("Valorant - משחק חדש שמפציץ בצופים!", "21/04/2020",
                  "גיימינג", "assets/images/valorant.jpg"),
              MainPagePost("Valorant - משחק חדש שמפציץ בצופים!", "21/04/2020",
                  "גיימינג", "assets/images/valorant.jpg"),
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
