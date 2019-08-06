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

void onPageChanged(int _currentIndex) {
    setState(() {
      print(1);
      this._currentIndex = _currentIndex;
    });
  }


 var _pageController = new PageController(initialPage: 0);
  var pages = <Widget>[
    GoPage(),
    HistoryPage(),
    SettingPage(),
  ];


void _onItemTapped(int index) {
    //bottomNavigationBar 和 PageView 关联
    _pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:new PageView.builder(
        onPageChanged: onPageChanged,
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return pages.elementAt(index);
        },
        
      ),
    backgroundColor: Color.fromRGBO(21, 20, 36, 1),


  /*   body: this._pageList[this._currentIndex],
    backgroundColor: Color.fromRGBO(21, 20, 36, 1), */


    bottomNavigationBar: BottomNavigationBar(
      currentIndex: this._currentIndex,
      //onTap: _onItemTapped,
      onTap: (int index){
        if(mounted) {
          setState(() {
            print(index);
            this._currentIndex = index;
             _pageController.animateToPage((_currentIndex),duration: Duration(milliseconds: 500),curve: Curves.ease);
          });
        }
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


