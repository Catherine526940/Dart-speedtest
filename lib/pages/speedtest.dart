/**
 * User:wfl
 * date:2019.7.27
 */
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'dart:math';
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
      body: Container(
          width: 540,
          height: 960,
          color: Color.fromRGBO(25, 26, 47, 1),
          child: NEIBU()),
    );
  }
}

class NEIBU extends StatefulWidget {
  NEIBU({Key key}) : super(key: key);

  _NEIBUState createState() => _NEIBUState();
}

class _NEIBUState extends State<NEIBU> {
  String _dateTime = DateTime.now().toString();
  int info_id = 0;
  String _dbName = 'user.db'; //数据库名称
  int download = 0;
  int upload = 0;
  int length=0;
  int suijishu1 = Random().nextInt(50);
  int suijishu2 = Random().nextInt(50);
  //最先加载
  initState() {
    super.initState();
    _query('user.db', 'SELECT * FROM speedtest_table');
    const period = const Duration(milliseconds: 500); //测试过程，速度调大
    Timer.periodic(period, (timer) {
      suijishu1 = Random().nextInt(200);
      //到时回调
      setState(() {
        download = download + suijishu1;
      });
      if (download >= 300) {
        //取消定时器，避免无限回调
        timer.cancel();
        timer = null;
        const period = const Duration(milliseconds: 500); //测试过程，速度调大
        Timer.periodic(period, (timer) {
          suijishu2 = Random().nextInt(50);
          //到时回调
          setState(() {
            upload = upload + suijishu2;
          });
          if (upload >= 300) {
            //取消定时器，避免无限回调
            timer.cancel();
            timer = null;
          }
        });
      }
    });
  }

  ///增
  _add(String dbName, String sql) async {
    //获取数据库路径
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    Database db = await openDatabase(path);
    await db.transaction((txn) async {
      await txn.rawInsert(sql);
    });
    await db.close();
    print("插入数据成功！");
  }

  //为了查条数，再次调用_query
  _query(String dbName,String sql) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    Database db = await openDatabase(path);
    List<Map> list = await db.rawQuery(sql);
    length=list.length;
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                height: 50.0,
                child: Icon(
                  Icons.file_download,
                  color: Color(0xff0EFEF7),
                  size: 25,
                ),
                alignment: Alignment(0, 0),
              ),
              Text(
                'DOWNLOAD',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ]),
            //upload
            Row(
              children: <Widget>[
                Container(
                  height: 50.0,
                  child: Icon(
                    Icons.file_upload,
                    color: Color(0xffE775FF),
                    size: 25,
                  ),
                  alignment: Alignment(0, 0),
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
            )
          ],
        ),
        //测试数据row布局
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              '$download',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              '$upload',
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //ping
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                    width: 300,
                    height: 70,
                    child: Stack(
                      children: <Widget>[
                        //Icon
                        Align(
                          alignment: Alignment(-0.9, 0),
                          child: Icon(
                            Icons.swap_horiz,
                            size: 25,
                            color: Colors.blue,
                          ),
                        ),
                        //text_ping
                        Align(
                            alignment: Alignment(-0.3, 0),
                            child: Text(
                              'Ping',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            )),
                        //text_--ms
                        Align(
                            alignment: Alignment(0.8, 0),
                            child: Text(
                              '32 ms',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )),
                        //'|'
                        Align(
                            alignment: Alignment(1, 0),
                            child: Text(
                              '|',
                              style:
                                  TextStyle(fontSize: 37, color: Colors.white),
                            )),
                      ],
                    )),
              ),
            ),
            //jitter
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                    width: 300,
                    height: 70,
                    child: Stack(
                      children: <Widget>[
                        //Icon
                        Align(
                          alignment: Alignment(-0.95, 0),
                          child: Icon(
                            Icons.graphic_eq,
                            size: 25,
                            color: Color(0xff11fff3),
                          ),
                        ),
                        //text_jitter
                        Align(
                            alignment: Alignment(-0.3, 0),
                            child: Text(
                              'Jitter',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            )),
                        //text_--ms
                        Align(
                            alignment: Alignment(0.8, 0),
                            child: Text(
                              '31 ms',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )),
                      ],
                    )),
              ),
            ),
            //Loss
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                    width: 300,
                    height: 70,
                    child: Stack(
                      children: <Widget>[
                        //'|'
                        Align(
                            alignment: Alignment(-1, 0),
                            child: Text(
                              '|',
                              style:
                                  TextStyle(fontSize: 37, color: Colors.white),
                            )),
                        //Icon
                        Align(
                          alignment: Alignment(-0.7, 0),
                          child: Icon(
                            Icons.multiline_chart,
                            size: 25,
                            color: Colors.orange,
                          ),
                        ),
                        //text_Loss
                        Align(
                            alignment: Alignment(0, 0),
                            child: Text(
                              'Loss',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            )),
                        //text_--%
                        Align(
                            alignment: Alignment(0.9, 0),
                            child: Text(
                              '0 %',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )),
                      ],
                    )),
              ),
            ),
          ],
        ),
////////////////////////////////

        Column(
          children: <Widget>[
            Container(
              width: 450,
              height: 120,
              child: Chart(),
              //////////折线图//////////////////////////
            ),
            Container(
              width: 300.0,
              height: 300.0,
              child: DashBoard(),
              //////////////////////////////////////表盘//////////////////////
            )
          ],
        ),

        Text(
          '$_dateTime',
          style: TextStyle(color: Colors.red),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("INSERT"),
              color: Color.fromRGBO(78, 201, 176, 1),
              textColor: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                print(length);
                info_id=length+1;
                String sql =
                    '''INSERT INTO speedtest_table(info_id,download_speed,upload_speed,create_time) 
                    VALUES(${info_id++},${download},${upload},'${_dateTime}')''';
                _add(_dbName, sql);
                _query('user.db', 'SELECT * FROM speedtest_table');
                print(length);
              },
            )
          ],
        ),
      ],
    );
  }
}
