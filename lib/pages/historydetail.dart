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
          'SPEEDTEST',                                    ///////头标题
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(78, 201, 176, 1)),
        ),
      ),
      body: Container(                                         ////////主要部分
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            SizedBox(width: 50,),
            Text(
                this.message3,                                  /////////显示日期
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(195, 195, 195, 1.0)),
              ),
            Container(                                        /////////////水分割平线
              width: double.infinity,
              height: 2.0,
              color: Color.fromRGBO(195, 195, 195, 1.0),
            ),
            ListTile(                                       //////////////下载图标所在行，及其组件
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
            Container(                                        //////////////空行控制间距
              width: double.infinity,
              height: 2.0,
              
            ),
            ListTile(                               //////////////上传图标所在行，及其组件
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
              color: Color.fromRGBO(195, 195, 195, 1.0),           ////////////水分割平线
            ),
            Container(
              width: double.infinity,
              height: 20.0,                                         ///////////空行，防止图表与水分割平线相距太近
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(                                           //////////用来存放ＰＩＮＧ的图标和数据
                  width: 110.0,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text("   "),                                ////////////////让ＰＩＮＧ图标显示居中，空格用来占位置
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
                Container(                                                 //////////用来存放JITTY的图标和数据
                  width: 110.0,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text("   "),                                    ///////////////让JITTY图标显示居中，空格用来占位置
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
                Container(                                                  //////////用来存放LOSE的图标和数据
                  width: 110.0,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text("     "),                                       ///////////////让LOSE图标显示居中，空格用来占位置
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
            Container(                                         ///////////////分割上面的数据与下面数据图标的距离
              width: double.infinity,
              height: 10.0,
              
            ),
            ListTile(                                      ///////////////显示列表中第一个图标
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
            
            ListTile(                                           ///////////////显示列表中第二个图标
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
            
            ListTile(                                         ///////////////显示列表中第三个图标
              title: Text(
                "192.168.1.33",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(195, 195, 195, 1.0)),
              ),
              leading: Icon(Icons.wifi_tethering,
                  size: 50.0, color: Color.fromRGBO(17, 255, 243, 1.0)),
            ),
            
            ListTile(                                         ///////////////显示列表中第四个图标
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