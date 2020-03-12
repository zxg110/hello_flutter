
import 'package:flutter/material.dart';
import 'package:hello_flutter/statemanager/redux/state_count.dart';
import 'package:hello_flutter/statemanager/scoped_model/count_model.dart';
import 'package:scoped_model/scoped_model.dart';



/**
 * 注意Provider的child是ProviderPage，所以只有ProviderPage的子组件才可以拿到
 * 该Provider的值，如果需要整个APP任意页面(子widg)拿到Counter，那么child需要是MyApp()
 */

CountModel countModel = CountModel();
class ScopedModelTestPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // Provider
    return ScopedModel<CountModel>(
      model:countModel,
      child:ScopedModelTestWidget(),
    );
  }
}

class ScopedModelTestWidget extends StatefulWidget{
  @override
  State<ScopedModelTestWidget> createState() {
  
    return ScopedModelTestWidgetState();
  }
}

class ScopedModelTestWidgetState extends State<ScopedModelTestWidget>{
  @override
  Widget build(BuildContext context) {
    // 
    return Scaffold(
      appBar: AppBar(title: Text('Provide test')),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('You have pushed the button this many times:'),
          ScopedModelDescendant<CountModel>(
            builder: (context,child,model){
              print('build ScopedModelDescendant');
          //    return Text(model.count.toString());
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("first ${ScopedModel.of<CountModel>(context).count}"),
            ],
          );
            }),
            //不动态 暂时不知道为啥
           new Text("${ScopedModel.of<CountModel>(context).count}"),
          new RaisedButton(
            onPressed: ()=>ScopedModel.of<CountModel>(context).increment(),
            child: Icon(Icons.add),),
            new RaisedButton(
            onPressed: ()=>ScopedModel.of<CountModel>(context).reduce(),
            child: Icon(Icons.ac_unit),)
        ],
      ),
    ),
    );
  }
}