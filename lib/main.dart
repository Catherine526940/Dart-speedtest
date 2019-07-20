import 'package:flutter/material.dart';
import 'pages/history.dart';
import 'pages/speed.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
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
          backgroundColor: Color.fromRGBO(21, 20, 36, 1),
          title: Center(
            child: Text(
              'S P E E D T E X T',
              style: TextStyle(color: Color.fromRGBO(78, 201, 176, 1)),
            ),
          )),
      body: 
      Container(
        color: Color.fromRGBO(21, 20, 36, 1),
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
                      fontSize: 60.0,
                      color: const Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontFamily: '微软雅黑',
                      letterSpacing: 3.0,
                    ),
                  ),
                  padding: EdgeInsets.all(66.5),
                  splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                  shape: CircleBorder(
                      side: BorderSide(
                          color: Color.fromRGBO(21, 20, 36, 1))), 
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

            SizedBox(height: 80.0),

            //中间的数据，位置啊，热点类型啊三个
            Container(
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
            ),

            SizedBox(height: 60),

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
                      Icons.shutter_speed,
                      size: 40,
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)), //加了一个小圆角
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SpeedPage()));
                    },
                    color: Colors.black,
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
                        borderRadius: BorderRadius.circular(50)), //加了一个小圆角
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HistoryPage()));
                    },
                    color: Colors.black,
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
                        borderRadius: BorderRadius.circular(50)), //加了一个小圆角
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HistoryPage()));
                    },
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5)
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
