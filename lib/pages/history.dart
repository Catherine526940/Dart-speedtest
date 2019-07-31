import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'historydetail.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String _dbName = 'user.db'; //数据库名称
  String _data = '暂无数据';
  int length = 0;
  List<int> randomdata1 = [];
  List<int> randomdata2 = [];
  List<String> randomdata3 = [];

  //写一个ifdel函数，判断是否删除表
  _ifdel() {
    if (length > 0) {
      String sql = "DELETE FROM speedtest_table"; //无条件删除测速表数据
      _delete(_dbName, sql);
      randomdata1 = [null];
      randomdata2 = [null];
      randomdata3 = [null];
      print(length);
    } else {
      print('无效删除，无数据！！');
    }
  }

  _delete(String dbName, String sql) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    Database db = await openDatabase(path);
    db.delete('speedtest_table');
    await db.close();
    if (length > 0) {
      setState(() {
        _data = "执行删除操作完成，该sql删除条件下的数目为：$length";
      });
    } else {
      setState(() {
        _data = "无法执行删除操作，该sql删除条件下的数目为：$length";
      });
    }
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
      print(kk);
    }
    print(randomdata1);
    print(randomdata2);
  }

  _getListData(BuildContext context) {
    List<Widget> widgets = [];
    length = randomdata1.length;
    for (int i = 0; i <= length - 1; i++) {
      widgets.add(new Padding(
        padding: new EdgeInsets.fromLTRB(5, 0, 5, 2),
        child: RaisedButton(
          color: Color.fromRGBO(21, 20, 36, 1),
          splashColor: Color.fromRGBO(78, 201, 176, 0.7), //水波纹颜色
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.wifi, size: 30, color: Color(0xff11fff3)),
                Text('\t\t\t\t\t\t\t'),
                Expanded(
                  child: Text('${randomdata3[i]}',
                      style: TextStyle(color: Colors.white)),
                ),

                //下载
                Expanded(
                  child: Center(
                    child: Text('${randomdata1[i]}',
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  ),
                ),

                //上传
                Expanded(
                  child: Center(
                    child: Text('${randomdata2[i]}',
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
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
      ));
    }
    return widgets;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _query('user.db', 'SELECT * FROM speedtest_table');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightthr = size.height;
    final widthfro = size.width;
    return Center(
        child: Column(children: <Widget>[
      //最上面哪一行，（title)
      Row(children: <Widget>[
        Expanded(
          child: Text('\t\tType',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Expanded(
          child:
              Text('Date', style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Icon(Icons.file_download, color: Color(0xff11fff3)),
        Expanded(
          child:
              Text('Mbps', style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Icon(Icons.file_upload, color: Color(0xffd86fff)),
        Expanded(
          child:
              Text('Mbps', style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Text('\n'),
        Text('\n'),
        Text('\n'),
        // SizedBox(height: 25.0),
      ]),
      //列表
      Container(
        height: heightthr * (4.8 / 7),
        child: ListView(children: _getListData(context)),
      ),
      //按钮
      Container(
        width: widthfro,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                height: 60,
                width: 150,
                child: RaisedButton(
                  color: Color.fromRGBO(78, 201, 176, 1),
                  child: Text(
                    '删除数据库',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  onPressed: () async {
                    var databasesPath = await getDatabasesPath();
                    String path = join(databasesPath, 'user.db');
                    await deleteDatabase(path);
                    print('删除数据库成功');
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 50,
              ),
            ),
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
                    '删除数据',
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
      )
    ]));
  }
}
