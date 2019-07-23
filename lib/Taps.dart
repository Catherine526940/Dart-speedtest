import 'package:flutter/material.dart';
import 'pages/go.dart';
import 'pages/history.dart';
import 'pages/setting.dart';

class Taps extends StatefulWidget { 
  Taps({Key key}) : super(key: key);

  _TapsState createState() => _TapsState();
}

class _TapsState extends State<Taps> {
  int _currentIndex=0;

  List _pageList=[
    GoPage(),
    HistoryPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          backgroundColor: Color.fromRGBO(21, 20, 36, 1),
          title: Text(
              'SPEEDTEST',
              style: TextStyle(fontWeight: FontWeight.w900,color: Color.fromRGBO(78, 201, 176, 1)),
            ),
          ),



    body: this._pageList[this._currentIndex],
    backgroundColor: Color.fromRGBO(21, 20, 36, 1),


    bottomNavigationBar: BottomNavigationBar(
      currentIndex: this._currentIndex,
      onTap: (int index){
        setState(() {
          print(index);
         this._currentIndex=index; 
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.network_check,size: 30,color: Colors.grey,),title: Text('Go')),
        BottomNavigationBarItem(icon: Icon(Icons.history,size: 30,color: Colors.grey,),title: Text('History')),
        BottomNavigationBarItem(icon: Icon(Icons.settings,size: 30,color: Colors.grey,),title: Text('Setting'))
      ],
      selectedItemColor: Color.fromRGBO(78, 201, 176, 1),
      backgroundColor: Color.fromRGBO(21, 20, 36, 1),
    ),

    );
  }
}