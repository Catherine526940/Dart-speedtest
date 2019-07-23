import 'package:flutter/material.dart';

class HisDetailPage extends StatelessWidget {

  String  message1,message2,message3;//下载，上传，日期
  HisDetailPage({this.message1,this.message2,this.message3});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            SizedBox(width: 50,),
            Text(
                this.message3,
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(195, 195, 195, 1.0)),
              ),
            Container(
              width: double.infinity,
              height: 2.0,
              color: Color.fromRGBO(195, 195, 195, 1.0),
            ),
            ListTile(
              title: Text(
                "DOWNLOAD",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(195, 195, 195, 1.0)),
              ),
              leading: Icon(Icons.get_app,
                  size: 30.0, color: Color.fromRGBO(17, 255, 243, 1.0)),
              trailing: Text(
                this.message1,
                style: TextStyle(
                    fontSize: 45.0, color: Color.fromRGBO(195, 195, 195, 1.0)),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2.0,
              
            ),
            ListTile(
              trailing: Text(
                this.message2,
                style: TextStyle(
                    fontSize: 45.0, color: Color.fromRGBO(195, 195, 195, 1.0)),
              ),
              title: Text(
                "UPLOAD",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(195, 195, 195, 1.0)),
              ),
              leading: Icon(
                Icons.publish,
                size: 30.0,
                color: Color.fromRGBO(216, 111, 255, 1.0),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2.0,
              
            ),
            Container(
              width: double.infinity,
              height: 20.0,
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 110.0,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text("      "),
                          Icon(Icons.swap_horiz,
                              size: 30.0,
                              color: Color.fromRGBO(195, 195, 195, 1.0)),
                          Text(" Ping",style: TextStyle(color: Colors.grey),),
                        ]),
                        Text(
                          "33",
                          style: TextStyle(
                              color: Color.fromRGBO(195, 195, 195, 1.0),
                              fontSize: 40.0),
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
                ),
                Container(
                  width: 110.0,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text("       "),
                          Icon(Icons.graphic_eq,
                              size: 30.0,
                              color: Color.fromRGBO(195, 195, 195, 1.0)),
                          Text(" Jitter",style: TextStyle(color: Colors.grey),),
                        ]),
                        Text(
                          "-",
                          style: TextStyle(
                              color: Color.fromRGBO(195, 195, 195, 1.0),
                              fontSize: 40.0),
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
                ),
                Container(
                  width: 110.0,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text("        "),
                          Icon(Icons.multiline_chart,
                              size: 30.0,
                              color: Color.fromRGBO(195, 195, 195, 1.0)),
                          Text(" Loss",style: TextStyle(color: Colors.grey),),
                        ]),
                        Text(
                          "-",
                          style: TextStyle(
                              color: Color.fromRGBO(195, 195, 195, 1.0),
                              fontSize: 40.0),
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
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 10.0,
              
            ),
            ListTile(
              title: Text(
                "Wifi/Data network",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(195, 195, 195, 1.0)),
              ),
              leading: Icon(
                Icons.filter_tilt_shift,
                size: 50.0,
                color: Color.fromRGBO(17, 255, 243, 1.0),
              ),
            ),
            Container(
              width: double.infinity,
              height: 10.0,
              
            ),
            ListTile(
              title: Text(
                "Serve Name",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(195, 195, 195, 1.0)),
              ),
              leading: Icon(
                Icons.donut_large,
                size: 50.0,
                color: Color.fromRGBO(17, 255, 243, 1.0),
              ),
            ),
            Container(
              width: double.infinity,
              height: 10.0,
            ),
            ListTile(
              title: Text(
                "192.168.1.33",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(195, 195, 195, 1.0)),
              ),
              leading: Icon(Icons.wifi_tethering,
                  size: 50.0, color: Color.fromRGBO(17, 255, 243, 1.0)),
            ),
            Container(
              width: double.infinity,
              height: 10.0,
            ),
            ListTile(
              title: Text(
                "KaiFeng",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(195, 195, 195, 1.0)),
              ),
              leading: Icon(Icons.place,
                  size: 50.0, color: Color.fromRGBO(17, 255, 243, 1.0)),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(21, 20, 36, 1),
    );
  }
}