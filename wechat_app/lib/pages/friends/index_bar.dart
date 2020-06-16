import 'package:flutter/material.dart';

import '../../const.dart';
import '../../const.dart';

class Index_Bar extends StatefulWidget {

  final void Function(String str) indexBarCallBack;

  Index_Bar({this.indexBarCallBack});

  @override
  _Index_BarState createState() => _Index_BarState();
}

int getIndex(BuildContext context,Offset globalPosition) {
  //拿到box
  RenderBox box = context.findRenderObject();
  //拿到y值
  double y = box.globalToLocal(globalPosition).dy;
  //计算字符高度
  var itemHeight = KScreenHeight(context) / 2 / INDEX_WORDS.length;
  //计算当前是第几个
  int index = y ~/ itemHeight;
  //
  String str = INDEX_WORDS[index];
  return index;
}

class _Index_BarState extends State<Index_Bar> {

  Color _textColor = Colors.black;
  Color _backgroundColor = Color.fromRGBO(1, 1, 1, 0.3);
  double _indicatorY = 0.0;
  String _indicatorText = 'A';
  bool _indicatorHidden = true;

  @override
  Widget build(BuildContext context) {

    List<Widget> words = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      words.add(
          Expanded(child: Text(
            INDEX_WORDS[i],
            style: TextStyle(color: _textColor),))
      );
    }

    return Positioned(
      right: 0.0,
      bottom: KScreenHeight(context) / 8,
      height: KScreenHeight(context) / 2,
      width: 100,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment(0, _indicatorY),
            width: 80,
            child: _indicatorHidden ? null : Stack(
              alignment: Alignment(-0.2, 0),
              children: <Widget>[
                Image(image: AssetImage('images/气泡.png'),width: 60,),
                Text(_indicatorText,style: TextStyle(fontSize: 20,color: Colors.white),),
              ],
            ),
          ),//气泡
          GestureDetector(
            child: Container(
              color: _backgroundColor,
              width: 20,
              child: Column(
                children: words,
              ),
            ),

            onVerticalDragUpdate: (DragUpdateDetails details) {
              int index = getIndex(context, details.globalPosition);

              setState(() {
                _indicatorText = INDEX_WORDS[index];
                //根据我们索引条的alignment的Y值进行运算，从-1.1到1.1
                //整个的y包含的值是2.2
                _indicatorY = 2.2 / INDEX_WORDS.length * index - 1.1;
                _indicatorHidden = false;
              });
              widget.indexBarCallBack(INDEX_WORDS[index]);
            },
            onVerticalDragDown: (DragDownDetails details){
              int index = getIndex(context, details.globalPosition);
              _indicatorText = INDEX_WORDS[index];
              _indicatorY = 2.2 / 28 * index - 1.1;
              _indicatorHidden = false;
              widget.indexBarCallBack(INDEX_WORDS[index]);
              setState(() {
                _textColor = Colors.white;
                _backgroundColor = Color.fromRGBO(1, 1, 1, 0.5);
              });
            },
            onVerticalDragEnd: (DragEndDetails details) {
              setState(() {
                _indicatorHidden = true;
                _textColor = Colors.black;
                _backgroundColor = Color.fromRGBO(1, 1, 1, 0.3);
              });
            },
          ),//索引条
        ],
      )
    ); //悬浮检索控件
  }
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];