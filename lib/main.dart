import 'package:flutter/material.dart';
import 'Taps.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _createTableSQL =
      '''CREATE TABLE speedtest_table (info_id INTEGER PRIMARY KEY, 
        download_speed DOUBLE,
        upload_speed DOUBLE,
        create_time VARCHAR(100)
        )'''; //创建测速表;
  String _data = "暂无数据";
  String _dbName = 'user.db'; //数据库名称
  int _dbVersion = 1; //数据库版本

  void initState() {
    super.initState();
    //创建数据库、测速表
    _createDb(_dbName, _dbVersion, _createTableSQL);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Taps(),
    );
  }
}

///创建数据库db
_createDb(String dbName, int vers, String dbTables) async {
  //获取数据库路径
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, dbName);
  print("数据库路径：$path数据库版本$vers");
  //打开数据库
  await openDatabase(path, version: vers,
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
    //数据库升级,只回调一次
    print("数据库需要升级！旧版：$oldVersion,新版：$newVersion");
  }, onCreate: (Database db, int vers) async {
    //创建表，只回调一次
    await db.execute(dbTables);
    await db.close();
  });
}
