import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'historydetail.dart';
import 'package:flutter/widgets.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool alarm = false; //确定后删除
  String _dbName = 'user.db'; //数据库名称
  String sql = "DELETE FROM speedtest_table"; //无条件删除测速表数据
  String iconk = 'wifi'; //定义一个字符改变图标
  int length = 0; //定义一个整型常量，即时记录list的长度
  //这三个列表为了接收数据库数据反映在屏幕上，
  List<int> randomdata1 = [];
  List<int> randomdata2 = [];
  List<String> randomdata3 = [];

  //写一个ifdel函数，判断是否删除表
  _ifdel() {
    if (length > 0) {
      _delete(_dbName, sql);
      print(length);
    } else {
      print('无效删除，无数据！！');
    }
  }

  //删除全部数据
  _delete(String dbName, String sql) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    Database db = await openDatabase(path);
    db.delete('speedtest_table');
    length = 0;
    await db.close();
    setState(() {
      randomdata1 = [];
      randomdata2 = [];
      randomdata3 = [];
    });
  }

  ///查全部
  _query(String dbName, String sql) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    Database db = await openDatabase(path);
    List<Map> list = await db.rawQuery(sql);
    await db.close();
    for (dynamic kk in list) {
      setState(() {
        randomdata1.add(kk['download_speed']);
        randomdata2.add(kk['upload_speed']);
        randomdata3.add(kk['create_time']);
      });
    }
    print("length=" + '${list.length}');
    length = list.length;
  }

  //列表的建立
  _getListData(BuildContext context) {
    List<Widget> widgets = [];
    length = randomdata1.length;
    for (int i = 0; i <= length - 1; i++) {
      int k = Random().nextInt(2); //定义一个int的随机变量改变icon的值
      if (k == 1) {
        widgets.add(new GestureDetector(
            child: Padding(
              padding: new EdgeInsets.fromLTRB(5, 0, 5, 2),
              child: RaisedButton(
                color: Color.fromRGBO(21, 20, 36, 1),
                splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //第一个图标
                      Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),

                      //加空格调整位置
                      Text('\t\t\t\t'),

                      //日期
                      Expanded(
                        child: Text('${randomdata3[i]}',
                            style: TextStyle(color: Colors.white)),
                      ),

                      //下载
                      Expanded(
                        child: Center(
                          child: Text('${randomdata1[i]}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0)),
                        ),
                      ),

                      //上传
                      Expanded(
                        child: Center(
                          child: Text('${randomdata2[i]}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HisDetailPage(
                          message1: '${randomdata1[i]}',
                          message2: '${randomdata2[i]}',
                          message3: '${randomdata3[i]}')));
                },
              ),
            ),
            onLongPress: () async {
              showDialog<Null>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return new AlertDialog(
                    title: new Text('提示'),
                    content: new SingleChildScrollView(
                      child: new ListBody(
                        children: <Widget>[
                          new Text('是否删除', style: TextStyle(fontSize: 30))
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('取消'),
                        onPressed: () {
                          alarm = false;
                          Navigator.of(context).pop();
                        },
                      ),
                      new FlatButton(
                        child: new Text('确定'),
                        onPressed: () {
                          alarm = true;
                          print(i);
                          _deletebyinfo_id(i + 1);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ).then((val) {
                print(val);
              });
            }));
      } else {
        widgets.add(new GestureDetector(
            child: Padding(
              padding: new EdgeInsets.fromLTRB(5, 0, 5, 2),
              child: RaisedButton(
                color: Color.fromRGBO(21, 20, 36, 1),
                splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //第一个图标
                      Icon(Icons.wifi_tethering,
                          size: 30, color: Color(0xff11fff3)),

                      //加空格调整位置
                      Text('\t\t\t\t'),

                      //日期
                      Expanded(
                        child: Text('${randomdata3[i]}',
                            style: TextStyle(color: Colors.white)),
                      ),

                      //下载
                      Expanded(
                        child: Center(
                          child: Text('${randomdata1[i]}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0)),
                        ),
                      ),

                      //上传
                      Expanded(
                        child: Center(
                          child: Text('${randomdata2[i]}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HisDetailPage(
                          message1: '${randomdata1[i]}',
                          message2: '${randomdata2[i]}',
                          message3: '${randomdata3[i]}')));
                },
              ),
            ),
            onLongPress: () async {
              showDialog<Null>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return new AlertDialog(
                    title: new Text('提示'),
                    content: new SingleChildScrollView(
                      child: new ListBody(
                        children: <Widget>[
                          new Text('是否删除', style: TextStyle(fontSize: 30))
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('取消'),
                        onPressed: () {
                          alarm = false;
                          Navigator.of(context).pop();
                        },
                      ),
                      new FlatButton(
                        child: new Text('确定'),
                        onPressed: () {
                          alarm = true;
                          print(i);
                          _deletebyinfo_id(i + 1);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ).then((val) {
                print(val);
              });
            }));
      }
    }
    return widgets;
  }

  //根据id删除
  _deletebyinfo_id(int info_id) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'user.db');
    Database db = await openDatabase(path);
    db.rawDelete('DELETE FROM speedtest_table WHERE info_id=$info_id');
    length--; //每次删完让length--
    await db.close(); //关闭数据库
    db = await openDatabase(path); //打开数据库
    //删除第一条时，页面无法刷新的解决
    if (length == 0 && info_id == 1) {
      setState(() {
        randomdata1 = [];
        randomdata2 = [];
        randomdata3 = [];
      });
    }
    //对删完之后的元素进行更改，让其id普减
    for (var i = info_id + 1; i <= length + 1; i++) {
      db.rawUpdate(
          'UPDATE speedtest_table SET info_id=${i - 1} WHERE info_id=${i}');
    }
    //让这个页面存储的数组清空，方便重新赋值，进而渲染页面
    randomdata1 = [];
    randomdata2 = [];
    randomdata3 = [];
    //把新数据库的内容赋给我们的数组，查询操作里面有赋值
    _query('user.db', 'SELECT * FROM speedtest_table');
  }

  @override
  void initState() {
    // TODO: implement initState
    _query('user.db', 'SELECT * FROM speedtest_table');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightthr = size.height;
    final widthfro = size.width;
    return Center(
        child: Column(children: <Widget>[
      //最上面哪一行，（title)
      Expanded(
        flex: 1,
        child: Row(children: <Widget>[
          Expanded(
            child: Text('\t\tType',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Expanded(
            child: Text('Date',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Icon(Icons.file_download, color: Color(0xff11fff3)),
          Expanded(
            child: Text('Mbps',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Icon(Icons.file_upload, color: Color(0xffd86fff)),
          Expanded(
            child: Text('Mbps',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Text('\n'),
          Text('\n'),
          Text('\n'),
          // SizedBox(height: 25.0),
        ]),
      ),

      //列表
      Expanded(
        flex: 10,
        child: Container(
          height: heightthr * (4.8 / 7),
          child: ListView(children: _getListData(context)),
        ),
      ),

      //按钮
      Expanded(
          flex: 1,
          child: Container(
            width: widthfro,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //left的按钮
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 60,
                    width: 150,
                    child: RaisedButton(
                      color: Color.fromRGBO(78, 201, 176, 1),
                      child: Text(
                        /* '删除数据库' */ '删除第一条',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      onPressed: () async {
                        _deletebyinfo_id(1);
                        /* //删除数据库的操作
                        var databasesPath = await getDatabasesPath();
                        String path = join(databasesPath, 'user.db');
                        await deleteDatabase(path);
                        print('删除数据库成功'); */
                      },
                    ),
                  ),
                ),
                //中间的间隙
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 50,
                  ),
                ),
                //right的按钮
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: RaisedButton(
                      color: Color.fromRGBO(78, 201, 176, 1),
                      child: Text(
                        '删除全部数据',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      onPressed: () {
                        _ifdel();
                      },
                    ),
                  ),
                )
              ],
            ),
          ))
    ]));
  }
}
