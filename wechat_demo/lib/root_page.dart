import 'package:flutter/material.dart';
import 'package:wechat/pages/chat_page.dart';
import 'package:wechat/discover/discover_page.dart';
import 'package:wechat/pages/friends_page.dart';
import 'package:wechat/pages/mine_page.dart';

class RootPageState extends StatefulWidget {
  @override
  _RootPageStateState createState() => _RootPageStateState();
}

class _RootPageStateState extends State<RootPageState> {
  int _currentIndex = 2;
  List<Widget> _page = [
    ChatPage(),
    FriendsPage(),
    DiscoverPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
//        backgroundColor: Color.fromRGBO(200, 200, 200, 1),
          currentIndex: _currentIndex,
          fixedColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/tabbar_chat.png',
                height: 20,
                width: 20,
              ),
              activeIcon: Image.asset('images/tabbar_chat_hl.png',
                  height: 20, width: 20),
              title: Text('微信'),
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/tabbar_friends.png',
                  height: 20,
                  width: 20,
                ),
                title: Text('通讯录'),
                activeIcon: Image.asset(
                  'images/tabbar_friends_hl.png',
                  height: 20,
                  width: 20,
                )),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/tabbar_discover.png',
                height: 20,
                width: 20,
              ),
              title: Text('发现'),
              activeIcon: Image.asset(
                'images/tabbar_discover_hl.png',
                height: 20,
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/tabbar_mine.png',
                height: 20,
                width: 20,
              ),
              backgroundColor: Colors.red,
              title: Text('我'),
              activeIcon: Image.asset(
                'images/tabbar_mine_hl.png',
                height: 20,
                width: 20,
              ),
            ),
          ]),
    );
  }
}
