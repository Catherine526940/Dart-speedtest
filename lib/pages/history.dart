import 'package:flutter/material.dart';
import 'historydetail.dart';
import 'speed.dart';
import 'setting.dart';


class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          centerTitle: true,
            backgroundColor: Color.fromRGBO(21, 20, 36, 1),
            title: Text(
                'H I S T O R Y',
                style: TextStyle(fontWeight: FontWeight.w900,color: Color.fromRGBO(78, 201, 176, 1)),
              ),
            ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30.0),
                Text('Type',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(width: 30.0),
                Text('Date',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(width: 30.0),
                Text("\t\t\t"),
                Icon(Icons.file_download, color: Color(0xff11fff3)),
                Text('Mbps',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(width: 30.0),
                Icon(Icons.file_upload, color: Color(0xffd86fff)),
                Text('Mbps',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
            
          ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('     ',),
                Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),
                SizedBox(width: 40.0),
                Text('07/13/19\n10:34', style: TextStyle(color: Colors.white)),
                SizedBox(width: 40.0),
                Text("232",style: TextStyle(color: Colors.white, fontSize: 25.0)),
                SizedBox(width: 50.0),
                Text("153",style: TextStyle(color: Colors.white, fontSize: 25.0)),
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('     '),
                Icon(Icons.settings_input_antenna,
                    size: 30, color: Color(0xff11fff3)),
                SizedBox(width: 40.0),
                Text('07/13/19\n09:37', style: TextStyle(color: Colors.white)),
                SizedBox(width: 40.0),
                Text("91.5",
                    style: TextStyle(color: Colors.white, fontSize: 25.0)),
                SizedBox(width: 40.0),
                Text("197",
                    style: TextStyle(color: Colors.white, fontSize: 25.0)),
              ],
            ),


            SizedBox(height: 428,),
            //底部
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
                      Icons.network_check,
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
                  color: Color.fromRGBO(78, 201, 176, 0.5),
                  height: 80,
                  width: 120,
                  child: RaisedButton.icon(
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: (){
                      Null;
                    },
                    splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                    icon: Icon(
                      Icons.history,
                      size: 40,
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)), //加了一个小圆角
                    color: Color.fromRGBO(78, 201, 176, 0.5),
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
                      size: 40,
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)), //加了一个小圆角
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SettingPage()));
                    },
                    color: Color.fromRGBO(21, 20, 36, 1),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 1)
          ],
        ),
        backgroundColor: Color.fromRGBO(21, 20, 36, 1),
        );
  }
}

