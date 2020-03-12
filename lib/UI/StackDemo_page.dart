import 'package:flutter/material.dart';

class StackDemoPage extends StatelessWidget {
  static const String routeName = '/stackDemo';

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('StackDemo'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            width: double.infinity,
            height: 150,
            decoration: new BoxDecoration(
              border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
            ),
            child: new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                //没做定位 位置根据alignment属性决定
                child: Text('没做定位',style: TextStyle(color: Colors.white)),
                color:Colors.red
              ),
              //定位x轴了，那么y轴位置根据alignment属性决定
              Positioned(
                left: 20,
                child: Text('定位距离左边20'),
              ),
              Positioned(
                left: 24,
                child: Text('定位距离左边24'),
              ),
              Positioned(
                top:22,
                child: Text('4444'),
              ),
            ],
          ),
          ),
          new Container(
            width: double.infinity,
            height: 150,
            decoration: new BoxDecoration(
              border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
            ),
            child: new Stack(
              //使用expand 未定位的组件会充满整个父布局
              fit: StackFit.expand,
              children: <Widget>[
    Positioned(
      left: 18.0,
      child: Text("I am Jack"),
    ),
    Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
      color: Colors.red,
    ),
    Positioned(
      top: 18.0,
      child: Text("Your friend"),
    )
  ],
            ),
          )
        ],
      )
    );
  }
}
