import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

class ForumNode extends StatefulWidget {
  final String title;
  final int threadsCount;
  final int msgCount;
  final String lastPostTitle;
  final String lastPostAuther;
  final IconData icon;
  final String date;
  final String imageUrl;

  ForumNode(this.title, this.threadsCount, this.msgCount, this.lastPostTitle,
      this.lastPostAuther, this.icon, this.date, this.imageUrl,
      {Key key})
      : super(key: key);

  @override
  _ForumNodeState createState() => _ForumNodeState();
}

class _ForumNodeState extends State<ForumNode> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                  child: Stack(
                    children: <Widget>[
                      Image(
                        image: AdvancedNetworkImage(widget.imageUrl),
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
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
                                ])),
                      ),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10.0)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, offset: Offset(-5, 5), blurRadius: 9)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      widget.title,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: Colors.white,
                        shadows: [Shadow(color: Colors.black, offset: Offset(2,2))],
                      ),
                    ),
                    Text(
                      "אשכולות: " +
                          widget.threadsCount.toString() +
                          " " +
                          "הודעות: " +
                          widget.msgCount.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          shadows: [Shadow(color: Colors.black, offset: Offset(2,2))],
                          color: Colors.white),
                    ),
                    Text(
                      widget.lastPostTitle + " - " + widget.lastPostAuther,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        shadows: [Shadow(color: Colors.black, offset: Offset(2,2))],
                        color: Colors.white,
                      ),
                    ),
                    Text(widget.date,style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        shadows: [Shadow(color: Colors.black, offset: Offset(2,2))],
                        color: Colors.white,
                      ),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Icon(
                    widget.icon,
                    color: Colors.grey,
                    size: 50,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
