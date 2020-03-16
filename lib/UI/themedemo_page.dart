import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
    primaryColor: Colors.amber,
    primarySwatch: Colors.red,
    accentColor: Colors.lightGreen,
    brightness: Brightness.light,
    cursorColor: Colors.deepPurpleAccent,
    accentColorBrightness: Brightness.dark,
    primaryColorBrightness: Brightness.light,
    textTheme: TextTheme(
      headline: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.purple),
      title: TextStyle(
          fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.teal),
      body1:
          TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.yellow),
      body2:
          TextStyle(fontSize: 19.0, fontFamily: 'Hind', color: Colors.yellow),
    ),
    sliderTheme: SliderThemeData(
        activeTickMarkColor: Colors.amber, activeTrackColor: Colors.blueAccent),
    indicatorColor: Colors.cyanAccent,
    scaffoldBackgroundColor: Colors.brown,
    dividerColor: Colors.deepOrange,
    iconTheme: IconThemeData(color: Colors.cyanAccent));

final ThemeData darkThemeData = ThemeData(
    primaryColor: Colors.brown,
    accentColor: Colors.pink,
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    primaryColorBrightness: Brightness.light,
    dividerColor: Colors.blueAccent,
    iconTheme: IconThemeData(color: Colors.blueAccent));

class ThemeDemo extends StatefulWidget {
  @override
  State<ThemeDemo> createState() {
    return ThemeState();
  }
}

class ThemeState extends State<ThemeDemo> {
  double sliderValue = 0;

  bool check = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeData,
        home: new Scaffold(
          drawer: rootDrawer,
          appBar: AppBar(title: Text('theme test')),
          //itemsIcon及文字与theme.primaryColor保持一致
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text(
                  'HOME',
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.email,
                ),
                title: Text(
                  'Email',
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pages,
                ),
                title: Text(
                  'PAGES',
                ))
          ]),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //不设置style，默认为theme中textTheme.body1样式
              Text('theme data test'),
              //颜色默认为theme iconTheme.color
              Icon(Icons.add),
              //默认颜色为灰色，没有跟随主题中某一属性走
              RaisedButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return simpleDialog;
                    }),
                child: Text('show dialog'),
              ),
              //默认颜色 theme.accentColor
              FloatingActionButton(onPressed: () => print('222')),
              //默认颜色为白色，没有跟随主题中某一属性走
              OutlineButton(
                child: Text('alert'),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alertDialog;
                    })),
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
              Switch(
                  value: this.check,
                  onChanged: (bool val) {
                    setState(() {
                      this.check = val;
                    });
                  }),
              //默认已拖动/未拖动 蓝色；根据主题sliderTheme走
              Slider(
                value: sliderValue,
                max: 100.0,
                min: 0.0,
                onChanged: (double val) {
                  this.setState(() {
                    this.sliderValue = val;
                  });
                },
              ),
              //默认颜色为accentColor
              LinearProgressIndicator(),
              //默认颜色为accentColor
              CircularProgressIndicator(),
              //默认颜色accentColor
              Checkbox(
                  value: this.check,
                  onChanged: (bool val) {
                    setState(() {
                      this.check = val;
                    });
                  }),
              Expanded(child: new Text('expanded'))
            ],
          ),
        ));
  }
}

//
Drawer rootDrawer = Drawer(child: DrawerWeiget());

class DrawerWeiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DrawerWeigetState();
  }
}

//抽屉
class _DrawerWeigetState extends State<DrawerWeiget> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.only(),
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text('XXXXX'),
          accountEmail: new Text('XXXXXXXXXXX'),
//          设置人物头像
          currentAccountPicture: new CircleAvatar(
            backgroundImage: new NetworkImage(
                'http://n.sinaimg.cn/translate/20170726/Zjd3-fyiiahz2863063.jpg'),
          ),
          otherAccountsPictures: <Widget>[
            new CircleAvatar(
              backgroundImage: new NetworkImage(
                  'http://n.sinaimg.cn/translate/20170726/Zjd3-fyiiahz2863063.jpg'),
            ),
            new CircleAvatar(
              backgroundImage: new NetworkImage(
                  'http://n.sinaimg.cn/translate/20170726/Zjd3-fyiiahz2863063.jpg'),
            ),
            new CircleAvatar(
              backgroundImage: new NetworkImage(
                  'http://n.sinaimg.cn/translate/20170726/Zjd3-fyiiahz2863063.jpg'),
            ),
            new CircleAvatar(
              backgroundImage: new NetworkImage(
                  'http://n.sinaimg.cn/translate/20170726/Zjd3-fyiiahz2863063.jpg'),
            ),
          ],
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          onDetailsPressed: () {},
        ),
        new ListTile(
            title: new Text('lifecycle 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/LifecyclePage');
            }),
        new Divider(),
        new ListTile(
            title: new Text('Route 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop(); /*隐藏drawer*/
              Navigator.pushNamed(context, '/RoutePage');
            }),
        new Divider(),
        new ListTile(
            title: new Text('数据存储 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/DataPage');
            }),
        new Divider(),
        new ListTile(
            title: new Text('Gesture 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/GesturePage');
            }),
        new Divider(),
        new ListTile(
            title: new Text('加载图片 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/LoadImgPage');
            }),
        new Divider(),
        new ListTile(
            title: new Text('网络请求 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/NetworkPage');
            }),
        new Divider(),
        new ListTile(
            title: new Text('基础Widget 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/BaseWidgetPage');
            }),
        new Divider(),
        new ListTile(
            title: new Text('进阶 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/AdvancedPage');
            }),
        new Divider(),
        new ListTile(
            title: new Text('Architecture 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/ArchitecturePage');
            }),
        new Divider(),
      ],
    );
  }
}

enum Option { A, B, C }

AlertDialog alertDialog = AlertDialog(
  title: new Text('标题'),
  content: new SingleChildScrollView(
    child: new ListBody(
      children: <Widget>[
        new Text('内容 1'),
        new Text('内容 2'),
      ],
    ),
  ),
  actions: <Widget>[
    new FloatingActionButton(
      child: new Text('确定'),
      onPressed: () {},
    ),
  ],
);

SimpleDialog simpleDialog = SimpleDialog(
  title: Text('SimpleDialog'),
  children: <Widget>[
    SimpleDialogOption(
      child: Text('Option A'),
      onPressed: () {},
    ),
    SimpleDialogOption(
      child: Text('Option B'),
      onPressed: () {},
    ),
    SimpleDialogOption(
      child: Text('Option C'),
      onPressed: () {},
    ),
  ],
);
