import 'package:flutter/material.dart';
import 'package:wechat/discover/discover_child_page.dart';

class DiscoverCell extends StatefulWidget {
  final String title;
  final String subTitle;
  final String imageName;
  final String subImagename;

  DiscoverCell({this.title, this.subTitle, this.imageName, this.subImagename});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DiscoverCellState();
  }
}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  DiscoverChildPage(widget.title))
          );
          setState(() {
            _currentColor = Colors.white;
          });
        },
        onTapDown: (TapDownDetails details) {
          setState(() {
            _currentColor = Colors.grey;
          });
        },
        onTapCancel: () {
          setState(() {
            _currentColor = Colors.white;
          });
        },
        child: Container(
            color: _currentColor,
            height: 54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage(widget.imageName),
                            width: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(widget.title),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          widget.subTitle != null
                              ? Text(widget.subTitle)
                              : Text(''),
                          widget.subImagename != null
                              ? Image(
                                  image: AssetImage(widget.subImagename),
                                  width: 12,
                                )
                              : Container(),
                          Image(
                            image: AssetImage('images/icon_right.png'),
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.grey,
                  height: 0.5,
                )
              ],
            )));
  }
}
