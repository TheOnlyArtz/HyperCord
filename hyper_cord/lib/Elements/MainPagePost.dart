import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainPagePost extends StatefulWidget {
  final String date;
  final String title;
  final String imagePath;
  final String category;

  MainPagePost(this.title, this.date, this.category, this.imagePath, {Key key})
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
        onTap: (){},
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                child:ClipRRect(
                  child: Stack(children: <Widget>[
                    Image(image: CachedNetworkImageProvider(widget.imagePath), width: 400, height: 200, fit: BoxFit.fill,),
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
                    BoxShadow(color: Colors.black, offset: Offset(-5, 5))
                  ],
                ),
              ),
              Positioned(
                child: SafeArea(
                  child: Container(width: 300, child:
                    Text(
                      widget.title,
                      overflow: TextOverflow.fade,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )
                ),
                bottom: 15,
                right: 10,
              ),
              Positioned(
                child: Text(
                  widget.date + "-" + widget.category,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.white, fontSize: 12),
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
