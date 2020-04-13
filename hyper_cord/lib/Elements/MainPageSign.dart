import 'package:flutter/material.dart';

class MainPageSign extends StatefulWidget {
  final String text;
  final Color signColor;

  MainPageSign(this.text, {this.signColor = Colors.purple, Key key})
      : super(key: key);

  @override
  _MainPageSignState createState() => _MainPageSignState();
}

class _MainPageSignState extends State<MainPageSign> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Container(), flex: 50,),
        Container(
          width: widget.text.length.toDouble() * 10 + 50,
          height: 40,
          decoration: BoxDecoration(         
              color: widget.signColor,
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.0))),
          child: Text( 
            widget.text,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 25, fontFamily: 'Assistant'),
          ),
        ),
        Expanded(child: Container(), flex: 1,),
      ],
    );
  }
}
