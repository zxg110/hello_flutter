import 'package:flutter/material.dart';
import 'package:hello_flutter/UI/InheritedWidgetTestRoute_page.dart';
import 'package:hello_flutter/async/AsyncStudy_page.dart';
import 'package:hello_flutter/statemanager/provider/main_provider.dart';
import 'package:hello_flutter/statemanager/redux/redux_page.dart';
import 'package:hello_flutter/statemanager/scoped_model/scoped_test_page.dart';
import 'LayoutDemo_page.dart';
import 'package:hello_flutter/UI/StackDemo_page.dart';
import 'network/NetworkDemo_page.dart';
import 'provider/shopping/ShoppingProviderRoute.dart';

void main() => runApp(MyApp());

init() {
  List<DemoBean> list = new List();
  DemoBean item =
      DemoBean(title: 'LayoutDemo', action: (context) => LayoutDemoPage());
  list.add(item);
  list.add(DemoBean(title: 'Stack', action: (context) => StackDemoPage()));
  list.add(DemoBean(title: 'Network', action: (context) => NetworkDemoPage()));
  list.add(DemoBean(title: 'Async', action: (context) => AsyncStudyPage()));
  list.add(DemoBean(
      title: 'InheritedWidget',
      action: (context) => InheritedWidgetTestRoutePage(title: 'test')));
  list.add(DemoBean(
      title: 'InheritedProviderShopping',
      action: (context) => ProviderRoute()));
  list.add(
      DemoBean(title: 'Provider', action: (context) => ProviderTestRoute()));
  list.add(DemoBean(title: 'Redux', action: (context) => ReduxPage()));
  list.add(DemoBean(
      title: 'ScopedModel', action: (context) => ScopedModelTestPage()));

  return list;
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
      ),
      // home: ShoppingList(
      // products: <Product>[
      //   new Product(name: 'Eggs'),
      //   new Product(name: 'Flour'),
      //   new Product(name: 'Chocolate chips'),
      // ],
      home: DemoListPage(dataList: init()),
    );
  }
}

class DemoBean {
  const DemoBean({this.title, this.action});

  final String title;
  final WidgetBuilder action;
}

class DemoListPage extends StatelessWidget {
  DemoListPage({Key key, this.dataList}) : super(key: key);

  final List<DemoBean> dataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('Flutter Demo'),
          backgroundColor: Color(0xff4caf50),
        ),
        body: new Container(
          child: new ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return new FlatButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: dataList[index].action)),
                    child: new Row(
                      children: <Widget>[
                        new Text(index.toString()),
                        new Padding(padding: EdgeInsets.only(right: 5.0)),
                        new Text(dataList[index].title)
                      ],
                    ));
              }),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _goNextPage(BuildContext context) {
    Navigator.pushNamed(context, "layoutDemo");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times  士大夫:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "layoutDemo"),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
