import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../const.dart';

class ChatPage extends StatefulWidget {



  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  Widget _PopupMenuItem (String imageName,String title) {
    return Row(
      children: <Widget>[
        Image(image: AssetImage(imageName),width: 20,),
        SizedBox(width: 20,),
        Text(title,style: TextStyle(color: Colors.white),),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    getDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: WeChatThemeColor,title: Text('微信'), actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10),
          child: PopupMenuButton(
            offset: Offset(0, 60.0),
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem(child: _PopupMenuItem('images/发起群聊.png', '发起群聊'),),
                PopupMenuItem(child: _PopupMenuItem('images/添加朋友.png', '添加朋友'),),
                PopupMenuItem(child: _PopupMenuItem('images/扫一扫1.png', '扫一扫'),),
                PopupMenuItem(child: _PopupMenuItem('images/收付款.png', '收付款'),),
              ];
            },
            child: Image(image: AssetImage('images/圆加.png'),width: 25,),
          ),//右上角菜单
        ),
      ],
      ),
      body: Container(
        child: Text('asdf'),
      ),
    );
  }

  //async 异步
  Future<List<Chat>> getDatas() async{
    final response = await http.get('http://rap2.taobao.org:38080/app/mock/258065/api/chat/list');
    if (response.statusCode == 200) {
      //获取数据，并转为map
      final responseBody = json.decode(response.body);
      //map转model
      responseBody['chat_list'].map(
          (item) {
            print(item);
          }
      );
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}

class Chat {
  final String name;
  final String message;
  final String imageUrl;

  const Chat( {this.name, this.message, this.imageUrl,});

  factory Chat.fromJson(Map json) {
    return Chat (
      name: json['name'],
      message: json['message'],
      imageUrl: json['image'],
    );
  }
}
