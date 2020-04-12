import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HyperCordBar extends StatelessWidget {
  const HyperCordBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      expandedHeight: 65,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
        color: Theme.of(context).primaryColor,
      )),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        IconButton(icon: Icon(FontAwesomeIcons.bolt), onPressed: () {}),
        IconButton(icon: Icon(FontAwesomeIcons.bell), onPressed: () {}),
        IconButton(
            icon: Icon(FontAwesomeIcons.envelope), onPressed: () {}),
        IconButton(
            icon: Image.network(
              "https://cdn.discordapp.com/attachments/590173552599236608/698613632526712832/unknown.png",
              fit: BoxFit.contain,
            ),
            onPressed: () {}),
        Expanded(
          child: Container(),
          flex: 20,
        ),
        Image.asset(
          "assets/images/logo.gif",
          fit: BoxFit.scaleDown,
        ),
        Expanded(
          child: Container(),
          flex: 5,
        ),
      ],
      floating: false,
      pinned: true,
    );
  }
}
