import 'package:flutter/material.dart';
import 'CartModel.dart';
import '../inherited_provider/ChangeNotifierProvider.dart';

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Builder(builder: (context) {
          print('Builder build');
          return Column(
            
            children: <Widget>[              
              Builder(builder: (context){
                print('Text build');
                var cart=ChangeNotifierProvider.of<CartModel>(context);
                return Text("总价: ${cart.totalPrice}");
              }),
              Builder(builder: (context){
                print("RaisedButton build"); //在后面优化部分会用到
                return RaisedButton(
                  child: Text("添加商品"),
                  onPressed: () {
                    //给购物车中添加商品，添加后总价会更新
                    ChangeNotifierProvider.of<CartModel>(context).add(Item(20.0, 1));
                  },
                );
              }),
            ],
          );
        }),
      ),
    );
  }
   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("_ProviderRouteState Dependencies change");
  }
}


class MyText extends StatefulWidget{
   final String text;

  MyText({Key key,this.text}):super(key:key);

  MyTextState createState() =>MyTextState();
  
}

class MyTextState extends State<MyText>{

  @override
  Widget build(BuildContext context) {


    print('MyTextState build');
    return Text('data:');
  }

  @override
  void didUpdateWidget(MyText oldWidget) {
    print('text:'+ widget.text+'old text:'+oldWidget.text);

    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('MyTextState didChangeDependencies');
    super.didChangeDependencies();
  }
}