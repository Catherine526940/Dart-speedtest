import 'package:flutter/material.dart';
import 'speedtest.dart';

class GoPage extends StatefulWidget {
  GoPage({Key key}) : super(key: key);

  _GoPageState createState() => _GoPageState();
}

class _GoPageState extends State<GoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(21, 20, 36, 0.99),
        child: Column(
          children: <Widget>[

////////////////////////////////////////////////GO圆形按钮/////////
            Container(
              padding: EdgeInsets.only(top:80.0),
              child: Container(
                height: 200.0,
                width: 200.0,
                child: RaisedButton(
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

                  padding: EdgeInsets.all(62),
                  splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                  shape: CircleBorder(
                      side: BorderSide(color: Color.fromRGBO(21, 20, 36, 1))
                      ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SpeedtestPage()));
                  },

                  color: Color.fromRGBO(21, 20, 36, 1),
                ),
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                    border:
                        new Border.all(width: 4.0, color: Color(0xff068586)),
                    color: Color.fromRGBO(21, 20, 36, 1),
                    borderRadius: BorderRadius.circular(150)
                    ),
              ),
            ),
////////////////////////////////////////////四行数据////////////////////////////////////////
            Container(
              padding: EdgeInsets.fromLTRB(20.0,50.0,0.0,0.0),
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
////////////////////////////////////////////////////////
            
          ],
        ),
      );
  }
}