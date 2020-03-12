import 'package:flutter/material.dart';


class LayoutDemoPage extends StatelessWidget {
  static const String routeName = '/layoutDemo';

  @override
  Widget build(BuildContext context) {
   
    return LayoutDemoView();
  }
}

class LayoutDemoView extends StatefulWidget{
  
  @override
  _LayoutDemoState createState() {
    
    return _LayoutDemoState();
  }
  
}

class _LayoutDemoState extends State<LayoutDemoView>{

@override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('LayoutDemo'),
      ),
      body: Container(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Text('column first widget'),
             RaisedButton(onPressed: null,color:Colors.blue,child: Text('333'),)
           ],
        ),
      ),
    );
  }

}




