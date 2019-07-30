/**
 * User:wfl
 * date:2019.7.27
 */




import 'package:flutter/material.dart';
import 'DashBoard.dart';
import 'Chart.dart';

class SpeedtestPage extends StatefulWidget {
  SpeedtestPage({Key key}) : super(key: key);

  _SpeedtestPageState createState() => _SpeedtestPageState();
}

class _SpeedtestPageState extends State<SpeedtestPage> {
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
     
      body: 
      Container(
        
          child:NEIBU(),
          
         ),
         backgroundColor: Color.fromRGBO(25, 26, 47, 1),
    );
  }
}

class Masd extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Column();
  }
}

class NEIBU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            //download
            Container(
              height: 30.0,
              width: 135,
              alignment: Alignment(0, 0),
              decoration: new BoxDecoration(
                  ),
                child:Row(
                children: <Widget>[
                 Icon(
                  Icons.file_download,
                  color: Color(0xff0EFEF7),
                  size: 25,
                ),
                Text(
                'DOWNLOAD',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ]
          ),
        ),
          //upload
        Container(
            height: 30.0,
            width: 113,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
                  ),
            child:Row(
              children: <Widget>[
                  Icon(
                    Icons.file_upload,
                    color: Color(0xffE775FF),
                    size: 25,
                  ),
                  Text(
                  'UPLOAD',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
              ),
          ],
        ),
        //测试数据row布局
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              '123',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              '456',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        ////ping-jitter-loss布局
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //ping
            Row(
              children: <Widget>[
                        //Icon
                        Icon(
                            Icons.swap_horiz,
                            size: 25,
                            color: Colors.blue,
                          ),
                        SizedBox(
                               width: 5,
                             ),
                        //text_ping
                          Text(
                              'Ping',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          SizedBox(
                               width: 5,
                             ),
                        //text_--
                          Text(
                              '32',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          SizedBox(
                               width: 5,
                             ),
                          //text_ms 
                          Text(
                              'ms',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                             
                        
                      ],
                    
                  ),
              
            //jitter
            Row(
                      children: <Widget>[
                        //'|'
                         Text(
                              '|',
                              style:
                                  TextStyle(fontSize: 37, color: Colors.white),
                            ),
                         SizedBox(
                               width: 5,
                             ),
                        //Icon
                         Icon(
                            Icons.graphic_eq,
                            size: 25,
                            color: Color(0xff11fff3),
                          ),
                        SizedBox(
                               width: 5,
                             ),
                        //text_jitter
                             Text(
                              'Jitter',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                        SizedBox(
                               width: 5,
                             ),
                        //text_--
                         Text(
                              '31',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                        SizedBox(
                               width: 5,
                         ),
                        //text_ms
                        Text(
                              'ms',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                        SizedBox(
                               width: 5,
                             ),
                        //'|'
                        Text(
                              '|',
                              style:
                                  TextStyle(fontSize: 37, color: Colors.white),
                            ),
                        
                      ],
                    ),
            ///////Loss
            Row(
                  children: <Widget>[
                        //Icon
                        Icon(
                            Icons.multiline_chart,
                            size: 25,
                            color: Colors.orange,
                          ),
                        
                        //text_Loss
                        SizedBox(
                               width: 5,
                             ),
                         Text(
                              'Loss',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                        //text_--
                        SizedBox(
                               width: 5,
                             ),
                         Text(
                              '0',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            SizedBox(
                               width: 5,
                             ),
                          //text_%
                            Text(
                              '%',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                ],
              ),
          ],
        ),

        Column(
          children: <Widget>[
            SizedBox(
              height: 1,
            ),
////////////////////////////////////折线图
            Container(

              height: 100,
              child: Chart(),
            ),
            SizedBox(
              height: 3,
            ),
 ///////////////////////////////////表盘 
            Container(
              width: 300.0,
              height: 300.0,
              child: DashBoard(),        
            ),
            
          ],
        ),
// ///////////////////////////////////RETEST
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             RaisedButton(
//               child: Text("RETEST"),
//               color: Color.fromRGBO(78, 201, 176, 1),
//               textColor: Colors.white,
//               elevation: 10,
//               shape: RoundedRectangleBorder(
//                 borderRadius:BorderRadius.circular(20) 
//                 ),
//               onPressed: (){
//                 print("retest");
//               },
//             )
//           ],
//         ),
      ],
    );
  }
}
