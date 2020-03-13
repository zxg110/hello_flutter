import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
    primaryColor: Colors.amber,
    accentColor: Colors.lightGreen,
    brightness: Brightness.light,
    cursorColor: Colors.deepPurpleAccent,
    accentColorBrightness: Brightness.dark,
    primaryColorBrightness: Brightness.light,
     textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold,color: Colors.purple),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic,color: Colors.teal),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind',color: Colors.yellow),
      body2: TextStyle(fontSize: 19.0, fontFamily: 'Hind',color: Colors.yellow),
    ),

 //   dividerColor: Colors.deepOrange,
    // iconTheme: IconThemeData(
    // color: Colors.blueAccent
    // )
     );

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

  bool check=true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeData,
        home: new Scaffold(
          appBar: AppBar(title: Text('theme test')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //不设置style，默认为theme中textTheme.body1样式
              Text('theme data test'),
              //颜色默认为theme iconTheme.color
              Icon(Icons.add),
              //默认颜色为灰色，没有跟随主题中某一属性走
              RaisedButton(onPressed: () => print('111')),
              //默认颜色 theme.accentColor
              FloatingActionButton(onPressed: () => print('222')),
              //默认颜色为白色，没有跟随主题中某一属性走
              OutlineButton(onPressed: ()=>print('444')),
              ExpansionTile(
                title: Text('抽屉'),
                //跟accentColor走
                leading: Icon(
                  Icons.public,
                ),
                children: <Widget>[Text('item1'), Text('item2'), Text('item3')],
              ),
              //底部直线颜色跟随primaryColor走
              //光标颜色为蓝色，若theme设置cursorColor 则默认为cursorColor
              TextField(
                decoration: InputDecoration(),
              ),
              //activeColor(激活原点颜色)accentColor activeTrackColor (激活条的颜色)accentColor
              Switch(value: check, onChanged: (bool val)=>print('111'))
            ],
          ),
        ));
  }
}
