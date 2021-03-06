import 'package:flutter/material.dart';


class ShareWidget extends InheritedWidget{
 
  int data;
 
  ShareWidget({@required this.data,Widget child}) : super(child: child);
 
  //定义一个方法，方便子树中的widget获取这个widget，进而获得共享数据。
  static ShareWidget of(BuildContext context){
    /**
     * 获取最近的给定类型的Widget，该widget必须是InheritedWidget的子类，
     * 并向该widget注册传入的context，当该widget改变时，
     * 这个context会重新构建以便从该widget获得新的值。
     * 这就是child向InheritedWidget注册的方法。
     */
    return context.inheritFromWidgetOfExactType(ShareWidget);
  }

  
 
  /**
   * framework通过使用以前占据树中的这个位置的小部件作为参数调用这个函数来区分这些情况。
   */
  @override
  bool updateShouldNotify(ShareWidget oldWidget) {
    print('ShareWidget updateShouldNotify oldData:'+oldWidget.data.toString()+",data:"+data.toString());
    return oldWidget.data != data;
  }
  }
