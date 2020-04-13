import 'package:flutter/material.dart';
import 'package:hyper_cord/Elements/HyperCordAppBar.dart';
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SettingsPage extends StatefulWidget {
  final Store<HypercordAppState> store;

  SettingsPage(this.store, {Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              ],
            ),
          );
        }
    );
  }
}
