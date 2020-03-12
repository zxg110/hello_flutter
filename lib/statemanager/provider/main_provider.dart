import 'package:flutter/material.dart';
import 'package:hello_flutter/statemanager/provider/counter.dart';
import 'package:provider/provider.dart';
/**
 * 注意Provider的child是ProviderPage，所以只有ProviderPage的子组件才可以拿到
 * 该Provider的值，如果需要整个APP任意页面(子widg)拿到Counter，那么child需要是MyApp()
 */
Counter count = Counter(1);
class ProviderTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // Provider
    return MultiProvider(providers: [
//      Provider<Counter>.value(value: count)
    ChangeNotifierProvider(builder: (_) => Counter(1)),
    ],child: ProviderPage());
  //   return ChangeNotifierProvider<Counter>.value(//1
  //   notifier: Counter(1),//2
  //   child: ProviderPage(),
  // );
  }
}

class ProviderPage extends StatefulWidget{
  @override
  State<ProviderPage> createState() {
  
    return ProviderState();
  }
}

class ProviderState extends State<ProviderPage>{
  @override
  Widget build(BuildContext context) {
    // 
    return Scaffold(
      appBar: AppBar(title: Text('Provide test')),
      body: Center(
      child: Column(
        children: <Widget>[
          Text("${Provider.of<Counter>(context).count}"),
//            Text("${count.count}"),
          RaisedButton(
            child: Text('add count'),
            onPressed: ()=>Provider.of<Counter>(context).add(),
          )
        ],
      ),
    ),
    );
  }
}