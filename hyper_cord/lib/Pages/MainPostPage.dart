import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hyper_cord/BBCode/compiler.dart';
import 'package:hyper_cord/rest/article.dart';
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';

//HERO
class MainPostPage extends StatefulWidget {
  final Store<HypercordAppState> store;
  final Article article;

  MainPostPage(this.article, this.store);

  @override
  _MainPostPageState createState() => _MainPostPageState();
}

class _MainPostPageState extends State<MainPostPage> {
  @override
  Widget build(BuildContext context) {
    var testt =
        BBCodeCompiler.compile(BBCodeCompiler.getAST(widget.article.message));

    return StoreConnector<HypercordAppState, HypercordAppState>(
      converter: (store) => store.state,
      builder: (context, data) {
        // print(widget.article.message);
        return Scaffold(
          backgroundColor: Color(0xff0f172d),
          body: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              elevation: 10,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                decoration: BoxDecoration(color: Color(0xff0f172d)),
                child: Stack(
                  children: <Widget>[
                    Image(
                      image: CachedNetworkImageProvider(
                          widget.article.thumbnailUrl),
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(color: Colors.black54),
                    )
                  ],
                ),
              )),
              floating: true,
              snap: false,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 16),
                  child: Container(
                    child: Text(
                      widget.article.title,
                      // textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSansHebrew",
                          fontSize: 27),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.only(end: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                              padding: EdgeInsetsDirectional.only(end: 15),
                              child: Text(
                                "${widget.article.username} - ${widget.article.viewCount}👁️ - 05/04/2020",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 50,
                            height: 50,
                            child: CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                    "https://hypercord.co.il/data/avatars/l/0/459.jpg?1585599871")),
                          ),
                        )
                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.only(end: 15, start: 15),
                    child: Divider(
                      color: Colors.white,
                    ),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.only(end: 8, start: 8),
                  child: Container(child: testt),
                )
              ]),
            )
          ]),
        );
      },
    );
  }
}
