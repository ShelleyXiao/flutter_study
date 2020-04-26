import 'package:flutter/material.dart';
import "package:english_words/english_words.dart";

class ListViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divder1 = Divider(
      color: Colors.blue,
    );
    Widget divder2 = Divider(
      color: Colors.red,
    );
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      itemCount: 100,
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divder1 : divder2;
      },
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() {
    return _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              _retrieveData();
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              );
            } else {
              return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    "沒有跟多了",
                    style: TextStyle(color: Colors.green),
                  ));
            }
          }
          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (context, index) => Divider(
              height: .0,
            ),
        itemCount: _words.length);
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }
}
