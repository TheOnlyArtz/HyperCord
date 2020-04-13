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
                    Container(
                      child: Align(
                        child: ClipPath(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.black,
                            backgroundImage: CachedNetworkImageProvider(
                                "https://media.discordapp.net/attachments/352484989847207947/696081347076292608/unknown.png"),
                          ),
                        ),
                      ),
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
                        Text(""),
                        Text(""),
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
