import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hyper_cord/Elements/HyperCordAppBar.dart';
import 'package:hyper_cord/Elements/MainPagePost.dart';
import 'package:hyper_cord/rest/client.dart' as hypercordApi;
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';

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

  _MainPageState() {
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<HypercordAppState, HypercordAppState>(
      converter: (store) => store.state,
      builder: (context, posts) {
        List<Widget> postsToDisplay = List<Widget>();
        if (posts.homePageHeaderPosts != null) {
          for (int i = 0; i < posts.homePageHeaderPosts.length; i++) {
            hypercordApi.ApiClient client = hypercordApi.ApiClient();

              postsToDisplay.add(MainPagePost(
                posts.homePageHeaderPosts[i].title,
                "24-4-2003",
                "GAMING",
                posts.homePageHeaderPosts[i].thumbnailUrl
              ));

            // client.getAttachmentUrl(posts.homePageHeaderPosts[i].coverImageId).then((value) => {
            //   print(value),
            //   postsToDisplay.add(MainPagePost(
            //     posts.homePageHeaderPosts[i].title,
            //     "24-4-2003",
            //     "GAMING",
            //     value
            //   ))
            // }).catchError((err) => {

            // });
          }
        }

        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: CustomScrollView(
            slivers: <Widget>[
              HyperCordBar(widget.store),
              SliverList(
                delegate: SliverChildListDelegate([
                  ...postsToDisplay
                ]),
              )
            ],
          ),
        );
      }
    );
  }
}
