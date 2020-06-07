

import 'package:flutter/material.dart';
import 'package:wechat/discover/discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  Color _themeColor = Color.fromRGBO(220, 220, 220, 1);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget._themeColor,
        //以下三个是专门为了安卓使用的属性
        title: Text('发现'),
        centerTitle: true,
        elevation: 0.0,//底部边栏
      ),
      body: Container(
        color: widget._themeColor,
        height: 800,
        child: Container(
          child: ListView(

            children: <Widget>[
              DiscoverCell(title:'朋友圈',imageName:'images/朋友圈.png'),
              SizedBox(height: 5,),
              DiscoverCell(title:'扫一扫',imageName:'images/扫一扫.png'),
              DiscoverCell(title:'摇一摇',imageName:'images/摇一摇.png'),
              SizedBox(height: 5,),
              DiscoverCell(title:'看一看',imageName:'images/看一看icon.png'),
              DiscoverCell(title:'搜一搜',imageName:'images/搜一搜.png'),
              SizedBox(height: 5,),
              DiscoverCell(title:'附近的人',imageName:'images/附近的人icon.png'),
              SizedBox(height: 5,),
              DiscoverCell(title:'购物',imageName:'images/购物.png',subTitle: '618限时特惠',subImagename: 'images/购物.png',),
              DiscoverCell(title:'游戏',imageName:'images/游戏.png'),
              SizedBox(height: 5,),
              DiscoverCell(title:'小程序',imageName:'images/小程序.png'),

            ],
          ),
        ),
      ),
    );
  }
}
