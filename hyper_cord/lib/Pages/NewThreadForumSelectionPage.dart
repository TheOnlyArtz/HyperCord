import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hyper_cord/Elements/MainPageForumNode.dart';
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';

class NewThreadForumSelectionPage extends StatefulWidget {
  final Store<HypercordAppState> store;

  const NewThreadForumSelectionPage(this.store, {Key key}) : super(key: key);
  @override
  _NewThreadForumSelectionPageState createState() =>
      _NewThreadForumSelectionPageState();
}

class _NewThreadForumSelectionPageState
    extends State<NewThreadForumSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<HypercordAppState, HypercordAppState>(
      converter: (store) => store.state,
      builder: (ctx, data) {
        Map<String, List<GestureDetector>> forumList = Map<String, List<GestureDetector>>();
        List<dynamic> results = [];

        widget.store.state.homePageNodes.forEach((element) {
          if (element.typeId == "Forum") {
            if (forumList[element.parentNodeId.toString()] == null) {
              forumList[element.parentNodeId.toString()] = List<GestureDetector>();
            }
            forumList[element.parentNodeId.toString()].add(
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, element);
                },
                child: ForumNode(
                  element.title,
                  0,
                  0,
                  "",
                  "",
                  Icons.games,
                  "",
                  element.nodeIcon),
              ));
          }
        });

        widget.store.state.homePageNodes.forEach((element) {
          if (element.typeId == "Category") {
            results.add(Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: double.infinity,
                // height: 40,
                child: Text(
                  element.title,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ));

            forumList[element.id.toString()].forEach((value) {
              results.add(value);
            });
          }
        });

        return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(height: 30),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "רשימת פורומים",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30),
                      ),
                    ),
                    ...results,
                  ]),
                )
              ],
            ));
      },
    );
  }
}
