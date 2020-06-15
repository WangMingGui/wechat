import 'package:flutter/material.dart';
import 'package:wechatapp/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  Widget headerWidget() {
    return Container(
      color: Colors.white,
      height: 200,
      child: Container(
//        color: Colors.yellow,
        margin: EdgeInsets.only(top: 100, bottom: 20),
        child: Row(
          children: <Widget>[
            Container(
//              color: Colors.red,
//              padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
              margin: EdgeInsets.only(left: 20),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Hank.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
//              child: Image(image: AssetImage('images/Hank.png')),
            ), //头像
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
//                    color: Colors.red,
//                        margin: EdgeInsets.only(top: 13, left: 10),
                        child: Text(
                          'Hank',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
//                        margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('微信号：123232323'),
                            Image(
                              image: AssetImage('images/icon_right.png'),
                              width: 15,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),//昵称
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text('我的'),),
      body: Stack(
        children: <Widget>[
          Container(
              color: Color.fromRGBO(220, 220, 220, 1),
              child: MediaQuery.removePadding(
                context: context,
                child: ListView(
                  children: <Widget>[
                    headerWidget(),
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(
                      title: '付款',
                      imageName: 'images/微信 支付.png',
                    ),
                    DiscoverCell(
                      title: '付款',
                      imageName: 'images/微信收藏.png',
                    ),
                  ],
                ),
                removeTop: true,
              )), //列表
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
