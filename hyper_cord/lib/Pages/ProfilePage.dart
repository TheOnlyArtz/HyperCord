import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hyper_cord/Elements/HyperCordAppBar.dart';
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';

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
              HyperCordBar(widget.store,
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
    );
  }
}
