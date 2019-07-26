import 'dart:math';

import 'package:flutter/material.dart';
import 'historydetail.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
//产生的随机数，本页面中只定义四个，即为前两个button上的数据。

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Column(children: <Widget>[
      //最上面哪一行，（title)
      Row(children: <Widget>[
        Expanded(
          child: Text('\t\tType',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Expanded(
          child:
              Text('Date', style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Icon(Icons.file_download, color: Color(0xff11fff3)),
        Expanded(
          child: Text('Mbps/s',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Icon(Icons.file_upload, color: Color(0xffd86fff)),
        Expanded(
          child: Text('Mbps/s',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Text('\n'),
        Text('\n'),
        Text('\n'),
        // SizedBox(height: 25.0),
      ]),
      Container(
        height: height * 2.90 / 4,
        child: ListView(children: _getListData(context)),
      ),
    ]);
  }
}
_getListData(BuildContext context) {
  List<Widget> widgets = [];
  for (int i = 0; i <= 50; i++) {
    int randomdata1 = Random().nextInt(300);
    int randomdata2 = Random().nextInt(300);
    int randomdata3 = Random().nextInt(2019);
    int mouth=Random().nextInt(12);
    int day=Random().nextInt(31);
    int hour=Random().nextInt(24);
    int mintin=Random().nextInt(60);
    widgets.add(new Padding(
      padding: new EdgeInsets.fromLTRB(5, 0, 5, 2),
      child: RaisedButton(
        color: Color.fromRGBO(21, 20, 36, 1),
        splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),
              Text('\t\t\t\t\t\t\t'),
              Expanded(
                child: Text('19/$mouth/$day\n  $hour:$mintin',
                    style: TextStyle(color: Colors.white)),
              ),
              Expanded(
                child: Center(
                  child: Text("$randomdata2",
                      style: TextStyle(color: Colors.white, fontSize: 25.0)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text("$randomdata1",
                      style: TextStyle(color: Colors.white, fontSize: 25.0)),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HisDetailPage(message1:'$randomdata1',message2:'$randomdata2',message3:'19/$randomdata3/$mouth/$day\n$hour:$mintin')));
        },
      ),
    ));
  }

  return widgets;
}


