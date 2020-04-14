import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';

class HyperCordBar extends StatefulWidget {
  final Store<HypercordAppState> store;

  final bool
      shift; // this shifts the buttons to the right to leave space for the return button.
      final bool useWave2;
  HyperCordBar(
    this.store, {
    this.shift: false,
    this.useWave2: false,
    Key key,
  }) : super(key: key);

  @override
  _HyperCordBarState createState() => _HyperCordBarState();
}

class _HyperCordBarState extends State<HyperCordBar> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<HypercordAppState, HypercordAppState>(
        converter: (store) => store.state,
        builder: (context, list) {
          return SliverAppBar(
            elevation: 10,
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipPath(
          child:  Image.network(
                'https://hypercord.co.il/app/bg.jpg',
                fit: BoxFit.cover,
                height: 200,
              ),
          clipper: widget.useWave2 ? BottomWaveClipper2() : BottomWaveClipper(),
        ),
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
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Scaffold())),
                  )),
              Tooltip(
                  message: "מה חדש",
                  child: IconButton(
                      icon: Icon(FontAwesomeIcons.bolt),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scaffold())))),
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
                    onPressed: () {
                    if (widget.shift == false) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scaffold()));
                    }
                  }),
              ),
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
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BottomWaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

