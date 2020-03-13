import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
    primaryColor: Colors.amber,
    accentColor: Colors.lightGreen,
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    primaryColorBrightness: Brightness.light,
    textTheme: TextTheme(),

 //   dividerColor: Colors.deepOrange,
    iconTheme: IconThemeData(
    color: Colors.blueAccent
    ));

final ThemeData darkThemeData = ThemeData(
  primaryColor: Colors.brown,
    accentColor: Colors.pink,
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    primaryColorBrightness: Brightness.light,
    dividerColor: Colors.blueAccent,
    iconTheme: IconThemeData(
    color: Colors.blueAccent
    ));


class ThemeStudyDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeData,
        home: new Scaffold(
          appBar: AppBar(title: Text('theme test')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.add),
              RaisedButton(onPressed: () => print('111')),
              FloatingActionButton(onPressed: () => print('222')),
              OutlineButton(onPressed: ()=>print('444')),
              ExpansionTile(
                title: Text('抽屉'),
                leading: Icon(
                  Icons.public,
                ),
                children: <Widget>[Text('item1'), Text('item2'), Text('item3')],
              )
            ],
          ),
        ));
  }
}
