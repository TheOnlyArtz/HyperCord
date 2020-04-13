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
                child:ClipRRect(child: Image(image: CachedNetworkImageProvider(widget.imagePath)),
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
                  child: Text(
                    widget.title,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
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
