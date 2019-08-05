import 'package:flutter/material.dart';
import 'speedtest.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:io';
import 'dart:convert';
import 'package:myapp/main.dart';

String ipdizhi;
main() async {
  // 内网ip
  // for (var interface in await NetworkInterface.list()) {
  //   for (var addr in interface.addresses) {
  //     print('${addr.address}');
  //   }
  // }
  //外网ip
  var ipRegexp = RegExp(
      r'((?:(?:25[0-5]|2[0-4]\d|(?:1\d{2}|[1-9]?\d))\.){3}(?:25[0-5]|2[0-4]\d|(?:1\d{2}|[1-9]?\d)))');
  var url = 'http://www.ip.cn/';
  var client = HttpClient();
  var request = await client.getUrl(Uri.parse(url));
  var reponse = await request.close();
  reponse.transform(utf8.decoder).forEach((line) {
    ipRegexp.allMatches(line).forEach((match) {
      ipdizhi = match.group(0);
    });
  });
}

class GoPage extends StatefulWidget {
  GoPage({Key key}) : super(key: key);

  _GoPageState createState() => _GoPageState();
}

class _GoPageState extends State<GoPage> {
  void initState() {
    super.initState();
    //创建数据库、测速表
    //测试ip刷新一下页面
    setState(() {
      main();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
        home:Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 20, 36, 1),
    title: Text("SPEEDTEST",
    style: TextStyle(
    fontWeight: FontWeight.w900,
    color: Color.fromRGBO(78, 201, 176, 1)),),
    centerTitle: true,
    ),


     body: Container(
      color: Color.fromRGBO(21, 20, 36, 0.99),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //加个盒子调距离
          SizedBox(height: size.height*(1/15),),
          //go框
          Container(
            width: size.height*(1.5/5),
            height: size.height*(1.5/5),
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
              splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
              /* shape: CircleBorder(
                      side: BorderSide(color: Color.fromRGBO(21, 20, 36, 1))), */
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(200))),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SpeedtestPage()));
              },
              color: Color.fromRGBO(21, 20, 36, 1),
            ),
            decoration: new BoxDecoration(
                border: new Border.all(width: 5.0, color: Color(0xff068586)),
                color: Color.fromRGBO(21, 20, 36, 1),
                borderRadius: BorderRadius.circular(size.height*(1.5/5)/2)),
          ),

          //加个盒子调距离
          SizedBox(height: size.height*(1/10),),
          //四行数据
          Container(
            height: size.height*(1.2/5),
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
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
                        fontSize: 25.0,
                        fontWeight: FontWeight.w100,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
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
                        fontSize: 25.0,
                        fontWeight: FontWeight.w100,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
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
                      "IP:  $ipdizhi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w100,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
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
                        fontSize: 25.0,
                        fontWeight: FontWeight.w100,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    )
    ));
  }
}
