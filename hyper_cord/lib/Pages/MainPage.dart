import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hyper_cord/Elements/HyperCordAppBar.dart';
import 'package:hyper_cord/Elements/MainPagePost.dart';
import 'package:hyper_cord/rest/client.dart' as hypercordApi;
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:hyper_cord/Elements/MainPageSign.dart';
import 'package:hyper_cord/Elements/MainPageForumNode.dart';

class MainPage extends StatefulWidget {
  final Store<HypercordAppState> store;

  MainPage(this.store, {Key key, this.title, post}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SliverList cachedSliverData;
  Future<SliverList> test;
  final client = hypercordApi.ApiClient();

  _MainPageState() {}

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<HypercordAppState, HypercordAppState>(
        converter: (store) => store.state,
        builder: (context, posts) {
          Map<String, List<GestureDetector>> forumList =
              Map<String, List<GestureDetector>>();
          List<dynamic> results = [];

          if (widget.store.state.homePageNodes != null) {
            widget.store.state.homePageNodes.forEach((element) {
              if (element.typeId == "Forum") {
                if (forumList[element.parentNodeId.toString()] == null) {
                  forumList[element.parentNodeId.toString()] =
                      List<GestureDetector>();
                }
                forumList[element.parentNodeId.toString()].add(GestureDetector(
                  onTap: () {
                    Navigator.pop(context, element);
                  },
                  child: ForumNode(element.title, 0, 0, "משחקים ממלצים", "aaa",
                      Icons.games, "14/04/2020", element.nodeIcon),
                ));
              }
            });

            widget.store.state.homePageNodes.forEach((element) {
              if (element.typeId == "Category") {
                results.add(Padding(
                    padding: const EdgeInsets.all(15),
                    child: MainPageSign(element.title)));

                forumList[element.id.toString()].forEach((value) {
                  results.add(value);
                });
              }
            });
  
          }

          List<Widget> postsToDisplay = List<Widget>();
            if (posts.homePageHeaderPosts != null) {
              for (int i = 0; i < posts.homePageHeaderPosts.length; i++) {
                postsToDisplay.add(
                    MainPagePost(posts.homePageHeaderPosts[i], widget.store));
              }
          }
          
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: CustomScrollView(
              slivers: <Widget>[
                HyperCordBar(widget.store),
                SliverList(
                  delegate: SliverChildListDelegate([
                    MainPageSign("כתבות אחרונות"),
                    ...postsToDisplay,
                    ...results
                    ]),
                )
              ],
            ),
          );
        });
  }
}
