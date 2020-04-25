import 'package:flutter/material.dart';

class SizeConstraintsRoute extends StatelessWidget {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('尺寸限制类容器'),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                value: .9,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50.0
              ),
              child: Container(
                height: 5.0,
                child: redBox,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child:  SizedBox(
                width: 80.0,
                height: 80.0,
                child: redBox,
              ),
               ),
            AspectRatio(
              aspectRatio: 3, //宽是高的三倍
              child: redBox,
            )
          ].map((e) => Padding(
            padding: EdgeInsets.only(top: 30),
            child: e,
          )).toList(),
        ),
      ),
    );
  }
}