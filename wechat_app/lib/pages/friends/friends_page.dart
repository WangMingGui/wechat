

import 'package:wechatapp/const.dart';
import 'package:flutter/material.dart';
import 'package:wechatapp/discover/discover_child_page.dart';
import 'package:wechatapp/pages/friends/friends_data.dart';
import 'package:wechatapp/pages/friends/index_bar.dart';

import '../../const.dart';
import '../../const.dart';
import '../../const.dart';
import 'friends_data.dart';
import 'friends_data.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}





class _FriendsPageState extends State<FriendsPage> {
  //字典里面放item和高度的对应数据
  final Map _groupOffsetMap = {
    INDEX_WORDS[0]: 0.0,
    INDEX_WORDS[1]: 0.0,
  };

  ScrollController _scrollController;

  final List<Friends> _listDatas = [];

  @override
  void initState() {
    super.initState();

    _listDatas..addAll(datas)..addAll(datas);
    //排序
    _listDatas.sort((Friends a, Friends b) {
      return a.indexLetter.compareTo(b.indexLetter);
    });

    var _gruopOffset = 50 * 4;
    //经过循环计算，将第一个头位置算出来，放入字典
    for (int i = 0; i < _listDatas.length; i++) {
      if (i < 1) {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _gruopOffset});
        //保存完再加_groupOffset便宜
        _gruopOffset += 80;
      } else if (_listDatas[i].indexLetter == _listDatas[i - 1].indexLetter) {
        _gruopOffset += 50;
      } else {
        //这部分就是有头部的cell了
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _gruopOffset});
        _gruopOffset += 80;
      }
    }

    ScrollController _scrollController;
  }


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

    //显示剩下的cell
    //如果当前和上一个group一样则隐藏
    bool _hiddenGroup = (index > 4 &&
        _listDatas[index - 4].indexLetter == _listDatas[index - 5].indexLetter);

    return _FriendCell(
      imageUrl: _listDatas[index - 4].imageUrl,
      name: _listDatas[index - 4].name,
      group: _hiddenGroup ? null : _listDatas[index - 4].indexLetter,
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
        body: Stack(
          children: <Widget>[
            Container(
              color: WeChatThemeColor,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _listDatas.length + _headerData.length,
                itemBuilder: _itemForRow,
              ),
            ), //列表
            Index_Bar(indexBarCallBack: (String str) {
              if(_groupOffsetMap[str] != null) {
                _scrollController.animateTo(_groupOffsetMap[str],
                    duration: Duration(milliseconds: 1), curve: Curves.easeIn);
              }
            },
            ),//悬浮检索
          ],
        ));
  }
}

class _FriendCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String groupTitle;
  final String imageAssets;
  final String group;

  const _FriendCell(
      {Key key,
      this.imageUrl,
      this.name,
      this.groupTitle,
      this.imageAssets,
      this.group})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10),
          color: Color.fromRGBO(1, 1, 1, 0),
          height: group != null ? 30 : 0,
          child: group != null
              ? Text(
                  group,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              : null,
        ),
        Container(
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
        ),
      ],
    );
  }
}
