import 'package:flutter/material.dart';

class ClipRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Widget avatr = Image.asset("imgs/avatar.png", width: 60);
    return Center(
      child: Column(
        children: <Widget>[
          avatr,
          ClipOval(child: avatr,),
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: avatr,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,
                child: avatr,
              ),
              Text("helllo world", style: TextStyle(color: Colors.green),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,
                child: avatr,
              ),
              Text("helllo world", style: TextStyle(color: Colors.green),)
            ],
          ),
        ],
      ),
    );
  }
}