import 'package:flutter/material.dart';
import 'ShareDataWidget.dart';

class InheritedWidgetTestRoutePage extends StatefulWidget {
  InheritedWidgetTestRoutePage({Key key, this.title}):super(key:key);

  final String title;
  @override
  _InheritedWidgetTestRouteState createState() =>_InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoutePage> {
  //状态定义的地方
  int _counter = 0;

  _increaseCounter(){
    print('set counter+1');
    setState(()=> ++_counter);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ShareWidget(   //使用ShareWidget
          data: _counter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text('You have clicked the button this many time:'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                //ShareWidget的子组件 可以使用ShareWidget
                child: _TextWidget(), //子widget中依赖ShareWidget
              ),
              RaisedButton(
                child: Text('Increment'),
                onPressed: () => _increaseCounter(),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
class _TextWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TextWidgetState();
  }
}
class _TextWidgetState extends State<_TextWidget>{
  @override
  Widget build(BuildContext context) {
    print('_TextWidgetState build');
    return Text(
      ShareWidget.of(context).data.toString()
    );
  }
 
  /**
   * 如果依赖的InheritedWidget改变了，framework将会调用这个方法来通知这个对象。
   * 在这个方法中调用BuildContext.inheritFromWidgetOfExactType是安全的。
   * 子类很少覆写这个方法，因为framework通常会在依赖的InheritedWidget改变后调用build方法，
   * 覆写这个方法通常用来做一些耗时的工作，比如网络请求
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("_TextWidgetState Dependencies change");
  }
}
