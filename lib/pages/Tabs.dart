import 'package:flutter/material.dart';
import 'tabs/Speed.dart';
import 'tabs/Setting.dart';
import 'tabs/History.dart';
import 'package:app01/main1.dart';

 




class Tap extends StatefulWidget {
  Tap({Key key}) : super(key: key);

  _TapState createState() => _TapState();
}

class _TapState extends State<Tap> {
  List _pageList = [
    HomeContent(),
    BODY1Page(),
    StateGo(),
    SettingPage(),
  ];
  var _currentIndex=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(21, 20, 36, 1),
          title: Center(
            child: Text(
              'S P E E D T E X T',
              style: TextStyle(color: Color.fromRGBO(78, 201, 176, 1)),
            ),
          )
      ),
      body: this._pageList[this._currentIndex],
        backgroundColor: Color(0xff191a2f),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(21, 20, 36, 1),
        currentIndex: this._currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: Colors.grey,
                size: 35,
              ),
              title: Text(
                'History',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shutter_speed,
                color: Colors.grey,
                size: 35,
              ),
              title: Text(
                'Speed',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
                size: 35,
              ),
              title: Text(
                'setting',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              )),
        ],
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
      )
    );
  }
}





























