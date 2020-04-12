import 'dart:ui';

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
      backgroundColor: Theme.of(context).primaryColor,

      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background:
           WavyHeaderImage(),
            ),
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


class WavyHeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child:ShaderMask(
            shaderCallback: (Rect bounds){
              return LinearGradient(
                colors: [Color.fromRGBO(77, 9, 24, 1), Color.fromRGBO(79, 55, 172, 1)],
              ).createShader(bounds);
            },
            child: Image.network('https://i.imgur.com/OEc5ZuI.jpg?1', fit: BoxFit.cover,),
            blendMode: BlendMode.color
            ),
      clipper: BottomWaveClipper(),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}