
import 'package:flutter/material.dart';
import 'package:hello_flutter/statemanager/redux/state_count.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'state_count.dart';

/**
 * 注意Provider的child是ProviderPage，所以只有ProviderPage的子组件才可以拿到
 * 该Provider的值，如果需要整个APP任意页面(子widg)拿到Counter，那么child需要是MyApp()
 */
final store = Store<CountState>(reducer, initialState: CountState.initState());
class ReduxTestRoute extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // Provider
    return StoreProvider<CountState>(store: store,
     child: MaterialApp(
       title:'Redux',
       home:ReduxPage()
     ));
  }
}

class ReduxPage extends StatefulWidget{
  @override
  State<ReduxPage> createState() {
  
    return ReduxState();
  }
}

class ReduxState extends State<ReduxPage>{
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
          StoreConnector<CountState,int>(
            builder: (context,count){
              return Text(count.toString());
            },
            converter: (store)=>store.state.count),
          StoreConnector(
            converter: (store){
              return ()=>store.dispatch(Action1.increment);
            },
            builder:(context,callback){
              return RaisedButton(
                child: Icon(Icons.add),
                onPressed: callback,
              );
            }
          )  
        ],
      ),
    ),
    );
  }
}