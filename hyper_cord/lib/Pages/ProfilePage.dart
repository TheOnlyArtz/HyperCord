import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hyper_cord/Elements/HyperCordAppBar.dart';
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatefulWidget {
  final Store<HypercordAppState> store;

  ProfilePage(this.store, {Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<HypercordAppState, HypercordAppState>(
        converter: (store) => store.state,
        builder: (context, data) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: CustomScrollView(
              slivers: <Widget>[
                HyperCordBar(
                  widget.store,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Align(
                      child: ClipPath(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.black,
                          backgroundImage: CachedNetworkImageProvider(
                              "https://media.discordapp.net/attachments/352484989847207947/696081347076292608/unknown.png"),
                        ),
                      ),
                    ),
                    Container(
                      height: 25,
                    ),
                    Column(
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        Text(
                          "גיימר חדש",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "הצטרף: אתמול ב 11:23",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 40,
                          child: Divider(
                            thickness: 2,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 25,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: Container(), flex: 20),
                        Column(
                          children: <Widget>[
                            Text(
                              "נקודות",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Expanded(child: Container(), flex: 10),
                        Column(
                          children: <Widget>[
                            Text(
                              "ציון תגובה",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Expanded(child: Container(), flex: 10),
                        Column(
                          children: <Widget>[
                            Text(
                              "הודעות",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Expanded(child: Container(), flex: 20),
                      ],
                    ),
                    Container(
                      height: 50,
                    ),
                    Column(
                      children: <Widget>[
                        Text("אודות",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Container(
                          height: 100,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                                "usr has not provided any additional information.",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          width: 40,
                          child: Divider(
                            thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                        
                        Text("פוסטים",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Container(
                          height: 100,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                                "usr has not posted any content recently.",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          color: Colors.blue,
                          height: 50,
                          width: double.infinity,
                        ),
                        Row(
                          children: <Widget>[Container(color: Colors.green)],
                        )
                      ],
                    ),
                    Container(
                      height: 800,
                    )
                  ]),
                )
              ],
            ),
          );
        });
  }
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
