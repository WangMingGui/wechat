import 'package:wechatapp/const.dart';
import 'package:flutter/material.dart';
import 'package:wechatapp/discover/discover_child_page.dart';
import 'package:wechatapp/friends_data.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final List _headerData = [
    Friends(imageUrl: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageUrl: 'images/群聊.png', name: '群聊'),
    Friends(imageUrl: 'images/标签.png', name: '标签'),
    Friends(imageUrl: 'images/公众号.png', name: '公众号'),
  ];

  Widget _itemForRow(BuildContext context, int index) {
    //显示头部
    if (index < _headerData.length) {
      return _FriendCell(
        imageAssets: _headerData[index].imageUrl,
        name: _headerData[index].name,
      );
    }
    return _FriendCell(
      imageUrl: datas[index - 4].imageUrl,
      name: datas[index - 4].name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '通讯录',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: WeChatThemeColor,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DiscoverChildPage('添加朋友'),
                ));
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Image(
                  image: AssetImage('images/icon_friends_add.png'),
                  width: 25,
                ),
              ),
            )
          ],
        ),
//      backgroundColor: WeChatThemeColor,
        body: ListView.builder(
          itemBuilder: _itemForRow,
          itemCount: _headerData.length + datas.length,
        ));
  }
}

class _FriendCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String groupTitle;
  final String imageAssets;

  const _FriendCell(
      {Key key, this.imageUrl, this.name, this.groupTitle, this.imageAssets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: imageUrl != null
                      ? NetworkImage(imageUrl)
                      : AssetImage(imageAssets)),
            ),
//            child: Image(image: AssetImage(imageAssets)),
          ),
          Container(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
