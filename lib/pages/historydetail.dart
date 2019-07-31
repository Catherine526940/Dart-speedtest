/*
User:WFL;
Date:7,23
*/
import 'package:flutter/material.dart';
class HisDetailPage extends StatelessWidget {

  String  message1,message2,message3;//下载，上传，日期
  HisDetailPage({this.message1,this.message2,this.message3});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/////////////////////////////////appbar   
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(21, 20, 36, 1),
        title: Text(
          'SPEEDTEST',                                    
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(78, 201, 176, 1)),
        ),
      ),
/////////////////////////////////////////////////////body
body:Container(
  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
  /////////竖直布局////以此往下分为三个部分
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      /////////////第一部分-日期-download-upload
      Column(
          children: <Widget>[
            Text(//日期
                this.message3,                                  
                style: TextStyle(
                    fontSize: 18.0,
                     color: Colors.white,
                     fontWeight: FontWeight.w900,
                     letterSpacing: 1.7
                    ),
            ),
            SizedBox(height: 13),
            Container(//分割线                                      
              width: double.infinity,
              height: 1.0,
              color: Color(0xff4E4F64),
            ),
            ListTile(//DOWNLOAD
            contentPadding:EdgeInsets.fromLTRB(0, 8, 0, 8),
              title:Text(
                "DOWNLOAD",
                style: TextStyle(
                    fontSize: 18.0,
                     color: Color.fromRGBO(195, 195, 195, 1.0),
                      fontWeight: FontWeight.w900,
                     letterSpacing: 1.7
                ),
              ),
              leading: Icon(Icons.get_app,
                  size: 25.0, color: Color.fromRGBO(17, 255, 243, 1.0)
              ),
              trailing:Text(
                this.message1,
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                      fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Container(//分割线                                      
              width: double.infinity,
              height: 1.0,
              color: Color(0xff4E4F64),
            ),
            ListTile(//UPLOAD
             contentPadding:EdgeInsets.fromLTRB(0, 8, 0, 8),
              title: Text(
                "UPLOAD",
                style: TextStyle(
                    fontSize: 18.0,
                     color: Color.fromRGBO(195, 195, 195, 1.0),
                      fontWeight: FontWeight.w900,
                     letterSpacing: 1.7
                ),
              ),
              leading: Icon(
                Icons.publish,
                size: 25.0,
                color: Color.fromRGBO(216, 111, 255, 1.0),
              ),
              trailing: Text(
                this.message2,
                style:  TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              color: Color(0xff4E4F64),           ////////////水分割平线
            ),
        ],
      ),
  /////////////第二部分-Ping-Jitter-Loss
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(//Ping
                  width: 90.0,
                  alignment: Alignment(0, 0),
                  decoration: new BoxDecoration(
                  ),
                 child:Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Icon(Icons.swap_horiz,
                              size: 30.0,
                              color: Colors.blue),
                          Text(" Ping",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w900,),),
                          ]
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(//中间数字
                          "33",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "ms",
                          style: TextStyle(
                              color: Color.fromRGBO(195, 195, 195, 1.0),
                              fontSize: 20.0),
                        )
                      ],
                  ),
              ),
          Container(//Jitter
              width: 90.0,
              alignment: Alignment(0, 0),
              decoration: new BoxDecoration(
              ),
              child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Icon(Icons.graphic_eq,
                          size: 30.0,
                          color: Color(0xff11fff3)),
                        Text(" Jitter",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w900),),
                      ]
                    ),
                    SizedBox(
                          height: 10,
                    ),
                    Text(//中间数字
                          "-",
                          style: TextStyle(
                             color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w100
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                          "ms",
                          style: TextStyle(
                              color: Color.fromRGBO(195, 195, 195, 1.0),
                              fontSize: 20.0),
                    )
                  ],
              ),
            ),
          Container(//Loss
                  width: 90.0,
                  alignment: Alignment(0, 0),
              decoration: new BoxDecoration(
              ),
                child: Column(
                  children: <Widget>[
                    Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[                                      ///////////////让LOSE图标显示居中，空格用来占位置
                      Icon(Icons.multiline_chart,
                              size: 30.0,
                              color: Colors.orange),
                          Text(" Loss",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w900),),
                      ]
                    ),
                    SizedBox(
                          height: 10,
                    ),
                    Text(//中间数字
                          "-",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w100
                          ),
                    ),
                    SizedBox(
                          height: 10,
                    ),
                    Text(
                          "%",
                          style: TextStyle(
                          color: Color.fromRGBO(195, 195, 195, 1.0),
                          fontSize: 20.0),
                        )
                      ],
                    ),
                ),
              ],
            ),
      /////////第三部分-TYPE-NAME-IP-LOCATION
      Column(
        children: <Widget>[
            //TYPE
            ListTile(
              title:Text(
                        "Type:  wifi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
              leading: Icon(
                Icons.filter_tilt_shift,
                size: 40.0,
               color: Color(0xff16F6F2)
              ),
            ),
            //NAME
            ListTile(
              title: Text(
                        "Server Name: Chinese",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
              leading: Icon(
                Icons.donut_large,
                size: 40.0,
                color: Color(0xff16F6F2),
              ),
            ),
            //IP
            ListTile(
              title: Text(
                        "IP:  192.168.1.33",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
              leading: Icon(Icons.wifi_tethering,
                  size: 40.0, color: Color(0xff16F6F2)),
            ),
            //LOCATION
            ListTile(
              title: Text(
                        "Location:  KaiFeng",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
              leading: Icon(Icons.place,
                  size: 40.0, color: Color(0xff16F6F2)),
            ),
          ],
        ),
    /////////  
      ],
      ),
      ),
      backgroundColor: Color.fromRGBO(21, 20, 36, 1),
    );
  }
}