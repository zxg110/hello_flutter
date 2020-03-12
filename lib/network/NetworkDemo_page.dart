import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';

class NetworkDemoPage extends StatelessWidget {
  static const String routeName = '/networkDemo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetworkDemo'),
      ),
      body: new _HttpTestRoute(),
    );
  }
}

class _HttpTestRoute extends StatefulWidget {
  @override
  _HttpTestRouteState createState() => new _HttpTestRouteState();
}

class _HttpTestRouteState extends State<_HttpTestRoute> {
  bool _loading = false;
  String _text = '';

  //可以看到使用future的回调地狱
  _requestNetByFuture() {
    HttpClient httpClient = new HttpClient();
    httpClient.getUrl(Uri.parse('https://www.baidu.com')).then((request) {
      print('request:' + request.toString());
      request.headers.add("user-agent",
          "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
      request.close().then((response) {
        print('response:' + response.toString());
        response.transform(utf8.decoder).join().then((data) {
          print('data:' + data);
          setState(() {
            _text = data;
            _loading = false;
          });
          httpClient.close();
        });
      });
    });
  }

  _requestNetByFuture2() {
    HttpClient httpClient = new HttpClient();
    httpClient.getUrl(Uri.parse('https://www.baidu.com'))
    .then((request) {
      print('request:' + request.toString());
      request.headers.add("user-agent",
          "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
      return request.close();})
    .then((response) {
      print('response:' + response.toString());
      return response.transform(utf8.decoder).join();
    })
    .then((dataString){
      print('dataString:' + dataString.toString());
      setState(() {
        _text = dataString;
        _loading = false;
      });
    });
  }

  _requestNetByAsync() async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse('https://www.baidu.com'));
      //使用iPhone的UA
      request.headers.add("user-agent",
          "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
      //等待连接服务器（会将请求信息发送给服务器）
      HttpClientResponse response = await request.close();
      //读取响应内容
      _text = await response.transform(utf8.decoder).join();
      //输出响应头
      print(response.headers);
      httpClient.close();
    } catch (e) {
      _text = "请求失败: $e";
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('get baidu'),
                onPressed: _loading
                    ? null
                    : () {
                        _requestNetByFuture2();
                      }),
            Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(_text.replaceAll(new RegExp(r"\s"), "")))
          ],
        ),
      ),
    );
  }
}
