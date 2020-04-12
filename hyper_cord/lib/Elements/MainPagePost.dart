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
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.asset(widget.imagePath),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            ),
            Positioned(
              child: SafeArea(
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              bottom: 15,
              right: 10,
            ),
            Positioned(
              child: Text(
                widget.date + "-" + widget.category,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              bottom: 5,
              right: 10,
            )
          ],
        ),
      ),
    );
  }
}
