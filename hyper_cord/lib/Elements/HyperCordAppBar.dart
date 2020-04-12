import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hyper_cord/Pages/ProfilePage.dart';
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';

class HyperCordBar extends StatefulWidget {
  final Store<HypercordAppState> store;


  final bool
      shift; // this shifts the buttons to the right to leave space for the return button.
  HyperCordBar(this.store, {
    this.shift: false,
    Key key,
  }) : super(key: key);

  @override
  _HyperCordBarState createState() => _HyperCordBarState();
}

class _HyperCordBarState extends State<HyperCordBar> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<HypercordAppState,HypercordAppState>(converter: (store) => store.state,
    builder: (context, list) {
      return SliverAppBar(
        elevation: 10,
        backgroundColor: Theme.of(context).primaryColor,
        expandedHeight: 250,
        flexibleSpace: FlexibleSpaceBar(
          background: WavyHeaderImage(),
        ),
        actions: <Widget>[
          this.widget.shift
              ? Expanded(
                  child: Container(),
                  flex: 20,
                )
              : Expanded(
                  child: Container(),
                  flex: 0,
                ),
          Tooltip(
              message: "חיפוש",
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Scaffold())),
              )),
          Tooltip(
              message: "מה חדש",
              child: IconButton(
                  icon: Icon(FontAwesomeIcons.bolt),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Scaffold())))),
          Tooltip(
            message: "התראות",
            child: IconButton(
                icon: Icon(FontAwesomeIcons.bell),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Scaffold()))),
          ),
          Tooltip(
            message: "שיחות",
            child: IconButton(
                icon: Icon(FontAwesomeIcons.envelope),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Scaffold()))),
          ),
          IconButton(
              icon: ClipOval(
                child: Image.network(
                  "https://cdn.discordapp.com/attachments/590173552599236608/698613632526712832/unknown.png",
                  height: 25,
                  width: 25,
                  fit: BoxFit.cover,
                ),
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage(widget.store)))),
          Expanded(
            child: Container(),
            flex: 20,
          ),
          Image.asset(
            "assets/images/logo.gif",
          ),
          Expanded(
            child: Container(),
            flex: 5,
          ),
        ],
        floating: true,
        snap: false,
        pinned: true,
      );
    });
  }
}

class WavyHeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.rtl,
      children: <Widget>[
        ClipPath(
          child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    Color.fromRGBO(77, 9, 24, 1),
                    Color.fromRGBO(79, 55, 172, 1)
                  ],
                ).createShader(bounds);
              },
              child: Image.network(
                'https://i.imgur.com/OEc5ZuI.jpg?1',
                fit: BoxFit.cover,
                height: 250,
              ),
              blendMode: BlendMode.color),
          clipper: BottomWaveClipper(),
        ),
      ],
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
