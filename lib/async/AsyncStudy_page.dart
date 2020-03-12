import 'package:flutter/material.dart';

// https://segmentfault.com/a/1190000014396421
//await关键字必须在async函数内部使用
//调用async函数必须使用await关键字
class House {
  House({this.name});
  final String name;
}

class AsyncStudyPage extends StatelessWidget {
  static const String routeName = '/asyncStudy';

  // handleHouseByThen()与handleHouseByThen()等效
  _simpleFuture() {
    fallInLove(); //谈恋爱；
    //result为Future<House>
    var result = handleHouseByThen(); //买房、入住(耗时、费用的操作)
    print('_simpleFuture return:' + result.toString());
    marry(); //结婚
    haveChild(); //生娃
  }

  _simpleAsync() async {
    fallInLove(); //谈恋爱；
    //result为House await后边的代码会等handleHouse()执行完再执行，相等于后边的逻辑变成handleHouse()成功后回调里的逻辑了
    var result = await handleHouseByThen(); //买房、入住(耗时、费用的操作)
    print('_simpleFuture return:' + result.toString());
    marry(); //结婚
    haveChild(); //生娃
  }

  ///进行买房 [buyHouse]、入住[livingHouse]等操作
  Future<House> handleHouseByThen() {
    print('handleHouse start');
    Future<House> house = buyHouse();
    print('handleHouse after bugHouse house:' + house.toString());
    house.then((data) {
      print('data:' + data.name);
      livingHouse();
    });
    return house;
  }

//{}内的逻辑会先塞到Event队列中并立即返回result
//main全部执行结束后，会从Event队列中取出并执行
  Future<House> buyHouse() {
    Future<House> result = Future(() {
      var house = new House(name: 'bieshu');
      print('buyHouse');
      return house;
    });
    print('buyHouse method over');
    return result;
  }

  /**
  * 这里没有理解通透
  buyHouse()返回的是Future<House>
  使用await调用后，result直接剥离为house了
  */
  Future<House> handleHouseByAwait() async {
    var result = await buyHouse();
    print('handlehouse 22:' + result.name);
    livingHouse();
    return result;
  }

  void livingHouse() {
    print('livingHouse');
  }

  void marry() {
    print('marry');
  }

  void haveChild() {
    print('haveChild');
  }

  void fallInLove() {
    print('fall in love');
  }

  getData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AsyncStudy'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('Simple'),
            onPressed: () => _simpleAsync(),
          ),
        ],
      ),
    );
  }
}
