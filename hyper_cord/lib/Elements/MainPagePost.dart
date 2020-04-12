import 'package:flutter/material.dart';
import 'package:hyper_cord/Pages/MainPage.dart';

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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    widget.imagePath,
                    height: 200.0,
                    fit: BoxFit.fill,
                  ),
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
