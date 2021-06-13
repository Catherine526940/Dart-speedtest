import 'package:flutter/material.dart';
import 'speedtest.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:io';
import 'dart:convert';
import 'package:myapp/main.dart';
import 'package:amap_location/amap_location.dart';
import 'dart:ui';

class GoPage extends StatefulWidget {
  GoPage({Key key}) : super(key: key);

  _GoPageState createState() => _GoPageState();
}

class _GoPageState extends State<GoPage> {
  String ipdizhi;
  String type;
  String loca1;
  String loca2;
  String loca3;
  String pingya;
  @override
  void initState() {
    super.initState();
    //测试ip刷新一下页面

    weizhi();
    main();
  }
  //求ping的值：
   pingzhi() async {
    Process.run('ping',['www.baidu.com']).then((result) {
    var res=result.stdout.toString();
    // print(res);
    var n=res.indexOf('Average');
    var ping=int.parse(res[n+10]+res[n+11]);
    print(ping.toString());
    setState(() {
          pingya=ping.toString();
    });
  });
}
//位置：
  weizhi() async {
    bool open = await AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    if (open == true) {
      AMapLocationClient.getLocation(true).then((address) {
        loca1 = address.latitude.toStringAsFixed(2);
        loca2 = address.longitude.toStringAsFixed(2);
        loca3 = address.city.toString();
        print("$loca3:($loca2 ， $loca1)");
      });
    }
    AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
      if (!mounted) return;
      setState(() {
        AMapLocationClient.startLocation();
      });
    });
  }

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
    //判断网络类型
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // 网络类型为移动网
      type = '4G';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // 网络类型为WIFI
      type = 'wifi';
    }
    ////////////这个是新加的，在测试阶段。
    else if (connectivityResult == ConnectivityResult.none) {
      // 网络未连接
      type = 'Error';
    }
     pingzhi();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Color.fromRGBO(21, 20, 36, 0.99),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //加个盒子调距离
          SizedBox(
            height: size.height * (1 / 20),
          ),
          //go框
          Container(
            width: size.height * (1.5 / 5),
            height: size.height * (1.5 / 5),
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
              splashColor: Color.fromRGBO(78, 201, 176, 0.7),
              //水波纹颜色
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
                borderRadius:
                    BorderRadius.circular(size.height * (1.5 / 5) / 2)),
          ),
          //加个盒子调距离
          SizedBox(
            height: size.height * (1 / 15),
          ),
          //四行数据
          Container(
            height: size.height * (1.5 / 5),
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
                        size: 33.0,
                      ),
                    ),
                    Text(
                      "Type:  $type",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
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
                        size: 33.0,
                      ),
                      padding: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      "Server Name:  Chinese",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
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
                        size: 33.0,
                      ),
                      padding: EdgeInsets.only(right: 10.0),
                    ),
                    //将IP地址传过来
                    Text(
                      "IP:  $ipdizhi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
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
                        size: 33.0,
                      ),
                      padding: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      "$loca3:($loca2,$loca1)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
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
    );
  }
}
