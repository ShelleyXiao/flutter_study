import 'package:flutter/material.dart';
import 'widgets/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: CounterWidget()
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == "tip") {
          return MaterialPageRoute(builder: (context) {});
        }
      },
      routes: {"tip2": (context) {}},
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  void _openPage(BuildContext context, PageInfo page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (!page.withScaffold) {
        return page.builder(context);
      }
      return PageScaffold(
        title: page.title,
        body: page.builder(context),
        padding: page.padding,
      );
    }));
  }

  List<Widget> _generateItem(BuildContext context, List<PageInfo> children) {
    return children.map<Widget>((page) {
      return ListTile(
        title: Text(page.title),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => _openPage(context, page),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: ListView(
        children: <Widget>[
//          ExpansionTile(
//            title: Text("第一个Flutter应用"),
//            children: [
////              _generateItem(context, [
////                PageInfo("路由传值", (context)=>Rou)
////              ]
//              ),
          ExpansionTile(
            title: Text("基础组件"),
            children: _generateItem(context, [
//              PageInfo("Context测试", (ctx) => ContextRoute(), withScaffold: false),
//              PageInfo("Widget树中获取State对象", (ctx) => RetrieveStateRoute(), withScaffold: false),
              PageInfo("文本、字体样式", (ctx) => TextRoute()),
//              PageInfo("按钮", (ctx) => ButtonRoute()),
//              PageInfo("图片伸缩", (ctx) => ImageAndIconRoute()),
//              PageInfo("单选开关和复选框", (ctx) => SwitchAndCheckBoxRoute()),
//              PageInfo("输入框",(ctx)=>FocusTestRoute()),
//              PageInfo("进度条", (ctx) => ProgressRoute()),
            ]),
          ),
        ],
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initVal: 0});

  final int initVal;

  @override
  _CounterWidgetState createState() {
    return new _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initVal;
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          onPressed: () => setState(() => ++_counter),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
