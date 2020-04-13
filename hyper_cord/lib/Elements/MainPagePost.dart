import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hyper_cord/Pages/MainPostPage.dart';
import 'package:hyper_cord/rest/article.dart';
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';

class MainPagePost extends StatefulWidget {
  final Article article;
  final Store<HypercordAppState> store;
  // final String date;
  // final String title;
  // final String imagePath;
  // final String category;

  MainPagePost(this.article, this.store, {Key key})
      : super(key: key);

  @override
  _MainPagePostState createState() => _MainPagePostState();
}

class _MainPagePostState extends State<MainPagePost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return MainPostPage(widget.article, widget.store);
            }
          ));
        },
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                child: ClipRRect(
                  child: Stack(children: <Widget>[
                    Image(image: CachedNetworkImageProvider(widget.article.thumbnailUrl), width: 400, height: 200, fit: BoxFit.fill,),
                      Container(width: 400, height: 200, decoration: BoxDecoration(
                      color: Colors.black26,
                      gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Color(0xff667eea),
                          Colors.black,
                          Color(0xff764ba2),
                        ],
                        stops: [
                          0.0,
                          0.5,
                          1.0
                        ]
                      )
                    ),),
                  ],),
                borderRadius: BorderRadius.circular(25.0)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(color: Colors.black, offset: Offset(-5, 5), blurRadius: 9)
                  ],
                ),
              ),
              // Positioned(
              //   top: 130,
              //   child: SizedBox(
              //     width: 400,
              //     height: 80,
              //     child: Container(
              //       decoration: BoxDecoration(
              //        color: Colors.black45
              //       )
              //     ),

              //   ),
              // ),

              Positioned(
                child: SafeArea(
                  child: Container(width: 370, child:
                    Text(
                      widget.article.title,
                      overflow: TextOverflow.fade,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ),
                bottom: 15,
                right: 10,
              ),
              Positioned(
                child: Text(
                  "GAMING",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
                bottom: 5,
                right: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
