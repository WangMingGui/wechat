import 'package:flutter/material.dart';
import 'package:wechatapp/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text('我的'),),
      body: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(220, 220, 220, 1),
            child: ListView(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: 200,
                ),
                SizedBox(height: 10,),
                DiscoverCell(title: '付款',imageName: 'images/微信 支付.png',),
              ],
            ),
          ), //列表
          Container(
            child: Positioned(
              child: Image(
                image: AssetImage('images/相机.png'),
                width: 20,
              ),
              top: 44,
              right: 10,
            ),
          ), //相机
          Container(),
        ],
      ),
    );
  }
}
