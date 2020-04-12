import 'package:flutter/material.dart';
import 'package:hyper_cord/Elements/HyperCordAppBar.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          HyperCordBar(
            shift: true,
          ),
          // Container(
          //   width: 50,
          //   height: 30,
          // ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Image.network(
                  "https://cdn.discordapp.com/attachments/590173552599236608/698613632526712832/unknown.png",
                  height: 200,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Container(
                height: 500,
              )
            ]),
          )
        ],
      ),
    );
  }
}
