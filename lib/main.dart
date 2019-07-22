import 'package:flutter/material.dart';
import 'pages/history.dart';
import 'pages/speed.dart';
import 'pages/setting.dart';

void main() => runApp(MyApp());

class MyApp  StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: HomeTown()
      );
  }
}



class HomeTown extends StatelessWidget {
  const HomeTown({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          backgroundColor: Color.fromRGBO(21, 20, 36, 1),
          title: Text(
              'S P E E D T E X T',
              style: TextStyle(fontWeight: FontWeight.w900,color: Color.fromRGBO(78, 201, 176, 1)),
            ),
          ),
      body: Container(
        color: Color.fromRGBO(21, 20, 36, 0.99),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            
            //上面的go,圆形盘
            Container(
              child: Container(
                height: 230.0,
                width: 230.0,
                child: RaisedButton(
                  child: Text(
                    'GO',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 50.0,
                      color: const Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontFamily: '微软雅黑',
                      letterSpacing: 3.0,
                    ),
                  ),
                  padding: EdgeInsets.all(66.5),
                  splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                  shape: CircleBorder(
                      side: BorderSide(color: Color.fromRGBO(21, 20, 36, 1))),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SpeedPage()));
                  },

                  color: Color.fromRGBO(21, 20, 36, 1),
                ),
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                    border:
                        new Border.all(width: 4.0, color: Color(0xff068586)),
                    color: Color.fromRGBO(21, 20, 36, 1),
                    borderRadius: BorderRadius.circular(150)),
              ),
            ),

            SizedBox(height: 20.0),

            //中间的数据，位置啊，热点类型啊四个
            Container(
              padding: EdgeInsets.fromLTRB(30.0, 60.0, 0.0, 0.0),
              child: Column(
                //2个child 竖直 排列
                children: <Widget>[
                  // 2 个child 水平 排列
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.filter_tilt_shift,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                      Text(
                        "Type:  wifi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height:15),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.alternate_email,
                          color: Colors.white,
                          size: 35.0,
                        ),
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        "Server Name:  chinese",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height:15),
                  Row(
                    children: <Widget>[
                      
                      Container(
                        child: Icon(
                          Icons.wifi_tethering,
                          color: Colors.white,
                          size: 35.0,
                        ),
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        "IP:  127.192.4.12",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height:15),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 35.0,
                        ),
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        "Location:  kaifeng",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

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
      ),
    );
  }
}

//定义两个数组，供上边调用
Widget goSection = Container(
  padding: EdgeInsets.fromLTRB(110.0, 100.0, 110.0, 0.0),
  child: Container(
      height: 160.0,
      width: 160.0,
      decoration: new BoxDecoration(
        border: new Border.all(width: 4.0, color: Color(0xff068586)),
        color: Color(0xff09091A),
        borderRadius: new BorderRadius.all(new Radius.circular(80.0)),
      ),
      child: Text(
        'GO',
        textAlign: TextAlign.center,
        maxLines: 1,
        style: TextStyle(
          fontSize: 40.0,
          color: const Color(0xffFFFFFF),
          fontWeight: FontWeight.bold,
          fontFamily: '微软雅黑',
          letterSpacing: 3.0,
        ),
      ),
      alignment: Alignment.center),
);

Widget textSection = Container(
  padding: EdgeInsets.fromLTRB(30.0, 60.0, 0.0, 0.0),
  child: Column(
    //2个child 竖直 排列
    children: <Widget>[
      //占满剩余空间

      // 2 个child 水平 排列
      Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.filter_tilt_shift,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          Text(
            "Type:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),

      Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.alternate_email,
              color: Colors.white,
              size: 35.0,
            ),
            padding: EdgeInsets.only(right: 10.0),
          ),
          Text(
            "Server Name:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
      Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.wifi_tethering,
              color: Colors.white,
              size: 35.0,
            ),
            padding: EdgeInsets.only(right: 10.0),
          ),
          Text(
            "IP:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    ],
  ),
);
