import 'package:flutter/material.dart';
import 'speed.dart';
import 'history.dart';
class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(21, 20, 36, 1),
            title: Center(
              child: Text(
                'SETTING         ',
                style: TextStyle(color: Color.fromRGBO(78, 201, 176, 1)),
              ),
            )),
        body: Container(
          child: Column(children: <Widget>[
            SizedBox(height:594),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Color.fromRGBO(21, 20, 36, 1),
                  height: 80,
                  width: 120,
                  child: RaisedButton.icon(
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                    icon: Icon(
                      Icons.shutter_speed,
                      size: 40,
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)), //加了一个小圆角
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SpeedPage()));
                    },
                    color: Color.fromRGBO(21, 20, 36, 1),
                  ),
                ),
                Container(
                  color: Color.fromRGBO(21, 20, 36, 1),
                  height: 80,
                  width: 120,
                  child: RaisedButton.icon(
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                    icon: Icon(
                      Icons.history,
                      size: 40,
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)), //加了一个小圆角
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HistoryPage()));
                    },
                    color: Color.fromRGBO(21, 20, 36, 1),
                  ),
                ),
                Container(
                  color: Color.fromRGBO(21, 20, 36, 1),
                  height: 80,
                  width: 120,
                  child: RaisedButton.icon(
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                    icon: Icon(
                      Icons.settings,
                      size: 42,
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)), //加了一个小圆角
                    onPressed: () {
                      Null;
                    },
                    color: Color.fromRGBO(78, 201, 176, 0.5),
                  ),
                ),
              ],
            ), 
          ],),
        ),
        backgroundColor: Color.fromRGBO(21, 20, 36, 0.99),
        );
  }
}