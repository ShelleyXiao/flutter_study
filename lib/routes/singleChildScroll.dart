import 'package:flutter/material.dart';

class SingleChildScrolViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "sdfffffffffffffffffffffffffffsfdsfafsf";
    return Scrollbar(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: str
                .split("")
                .map((e) => Text(
                      e,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
