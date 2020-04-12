import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextRoute extends StatefulWidget {
  @override
  State createState() => _TextRouteState();
}

class _TextRouteState extends State<TextRoute> {

  GestureRecognizer _tapRecongnizer;


  @override
  void initState() {
    _tapRecongnizer = TapGestureRecognizer();
    super.initState();
  }


  @override
  void dispose() {
    _tapRecongnizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>
        [Text(
            "hello world",
            textAlign: TextAlign.center,
          ),
        Text(
          "hollo world! i am xiao" * 4,
          maxLines:  1,
          overflow: TextOverflow.ellipsis,
        ),
          Text(
            "hello world",
            textScaleFactor: 1.4,
          ),
          Text(
            "hello world",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              fontFamily: "Courier",
              height: 1.2,
              background: new Paint()..color=Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed
            ),
          ),
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0
            ),
            textAlign: TextAlign.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("hillo"),
                Text("dd"),
                Text("i amd ",
                style: TextStyle(
                  inherit: false,
                  color: Colors.grey
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
