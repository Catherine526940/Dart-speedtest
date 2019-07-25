import 'dart:math';

import 'package:flutter/material.dart';
import 'historydetail.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
//产生的随机数，本页面中只定义四个，即为前两个button上的数据。
  var randomdata=Random().nextInt(200);
  var randomdata1=Random().nextInt(200);
  var randomdata2=Random().nextInt(200);
  var randomdata3=Random().nextInt(200);
  @override
  Widget build(BuildContext context) {
  return Column(children: <Widget>[
    //最上面哪一行，（title)
            Row(children: <Widget>[
            SizedBox(width: 25.0),
            Expanded(child:Text('\t\t\tType', style: TextStyle(color: Colors.white, fontSize: 20 )),),
            Expanded(child: Text('Date', style: TextStyle(color: Colors.white, fontSize: 20)),),
            Icon(Icons.file_download, color: Color(0xff11fff3)),
            Expanded(child:  Text('Mbps', style: TextStyle(color: Colors.white, fontSize: 20)),),
            Icon(Icons.file_upload, color: Color(0xffd86fff)),
            Expanded(child: Text('Mbps', style: TextStyle(color: Colors.white, fontSize: 20)),)
             ]
            ),
          //下拉列表框，因为在这里给它高度为500，可能会有一些问题，暂时没有找到解决方法：
          Container(
          height: 500.0,
          child:
          ListView(
          children: <Widget>[
//first button:
        RaisedButton(
        color: Color.fromRGBO(21, 20, 36, 1),
        splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
        child: Container( 
            height: 60,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),),   
              Expanded(child:Text('07/13/19\n10:34', style: TextStyle(color: Colors.white)),),
              Expanded(child:Text("$randomdata",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
              Expanded(child:Text("\t\t$randomdata1",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
            ],
          ),
        ),
              onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HisDetailPage(message1: '232',message2: '153',message3: '07/13/19 10:34',)));
              },
             ),       
//second button:
        RaisedButton(
        color: Color.fromRGBO(21, 20, 36, 1),
        splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
        child: Container( 
            height: 60,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),),   
              Expanded(child:Text('07/13/19\n10:34', style: TextStyle(color: Colors.white)),),
              Expanded(child:Text("$randomdata2",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
              Expanded(child:Text("\t\t$randomdata",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
            ],
          ),
        ),
              onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HisDetailPage(message1: '232',message2: '153',message3: '07/13/19 10:34',)));
              },
             ),     
//button:
        RaisedButton(
        color: Color.fromRGBO(21, 20, 36, 1),
        splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
        child: Container( 
            height: 60,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),),   
              Expanded(child:Text('07/13/19\n10:34', style: TextStyle(color: Colors.white)),),
              Expanded(child:Text("$randomdata",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
              Expanded(child:Text("\t\t$randomdata2",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
            ],
          ),
        ),
              onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HisDetailPage(message1: '232',message2: '153',message3: '07/13/19 10:34',)));
              },
             ),     
//button:
        RaisedButton(
        color: Color.fromRGBO(21, 20, 36, 1),
        splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
        child: Container( 
            height: 60,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),),   
              Expanded(child:Text('07/13/19\n10:34', style: TextStyle(color: Colors.white)),),
              Expanded(child:Text("$randomdata3",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
              Expanded(child:Text("\t\t$randomdata1",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
            ],
          ),
        ),
              onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HisDetailPage(message1: '232',message2: '153',message3: '07/13/19 10:34',)));
              },
             ),     
//button：
        RaisedButton(
        color: Color.fromRGBO(21, 20, 36, 1),
        splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
        child: Container( 
            height: 60,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),),   
              Expanded(child:Text('07/13/19\n10:34', style: TextStyle(color: Colors.white)),),
              Expanded(child:Text("$randomdata",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
              Expanded(child:Text("\t\t$randomdata1",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
            ],
          ),
        ),
              onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HisDetailPage(message1: '232',message2: '153',message3: '07/13/19 10:34',)));
              },
             ),     
//button:
        RaisedButton(
        color: Color.fromRGBO(21, 20, 36, 1),
        splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
        child: Container( 
            height: 60,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            // Text('  '),
              Expanded(child: Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),),   
              Expanded(child:Text('07/13/19\n10:34', style: TextStyle(color: Colors.white)),),
             //SizedBox(width: 40.0),
              Expanded(child:Text("$randomdata",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
            // SizedBox(width: 47.0),
              Expanded(child:Text("\t\t$randomdata1",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
            ],
          ),
        ),
              onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HisDetailPage(message1: '232',message2: '153',message3: '07/13/19 10:34',)));
              },
             ),     
//button:
        RaisedButton(
        color: Color.fromRGBO(21, 20, 36, 1),
        splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
        child: Container( 
            height: 60,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),),   
              Expanded(child:Text('07/13/19\n10:34', style: TextStyle(color: Colors.white)),),
              Expanded(child:Text("$randomdata",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),,
              Expanded(child:Text("\t\t$randomdata1",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
            ],
          ),
        ),
              onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HisDetailPage(message1: '232',message2: '153',message3: '07/13/19 10:34',)));
              },
             ),     
//button:
        RaisedButton(
        color: Color.fromRGBO(21, 20, 36, 1),
        splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
        child: Container( 
            height: 60,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),),   
              Expanded(child:Text('07/13/19\n10:34', style: TextStyle(color: Colors.white)),),
              Expanded(child:Text("$randomdata",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
              Expanded(child:Text("\t\t$randomdata1",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
            ],
          ),
        ),
              onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HisDetailPage(message1: '232',message2: '153',message3: '07/13/19 10:34',)));
              },
             ),     
//button:
        RaisedButton(
        color: Color.fromRGBO(21, 20, 36, 1),
        splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
        child: Container( 
            height: 60,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),),   
              Expanded(child:Text('07/13/19\n10:34', style: TextStyle(color: Colors.white)),),
              Expanded(child:Text("$randomdata",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
              Expanded(child:Text("\t\t$randomdata1",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
            ],
          ),
        ),
              onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HisDetailPage(message1: '232',message2: '153',message3: '07/13/19 10:34',)));
              },
             ),     
//button:
        RaisedButton(
        color: Color.fromRGBO(21, 20, 36, 1),
        splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
        child: Container( 
            height: 60,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),),   
              Expanded(child:Text('07/13/19\n10:34', style: TextStyle(color: Colors.white)),),
              Expanded(child:Text("$randomdata",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
              Expanded(child:Text("\t\t$randomdata1",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),),
            ],
          ),
        ),
              onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HisDetailPage(message1: '232',message2: '153',message3: '07/13/19 10:34',)));
              },
             ),     
          ],
         ),     
       ),
      ]
   );
  }
}