import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Speedtest {
  int info_id;
  String server_name;
  String server_ip_address;
  String hotspot_name;
  String ip_address;
  String network_type;
  int download_speed;
  int upload_speed;
  String loss_rate;
  int jitter;
  int ping;
  String longitude;
  String latitude;
  String upload_datasize;
  String download_datasize;
  String thread_type;
  String create_time;
  String note;

  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();
    map['info_id']=info_id;
    map['server_name']=server_name;
    map['server_ip_address']=server_ip_address;
    map['hotspot_name']=hotspot_name;
    map['ip_address']=ip_address;
    map['network_type']=network_type;
    map['download_speed']=download_speed;
    map['upload_speed']=upload_speed;
    map['loss_rate']=loss_rate;
    map['jitter']=jitter;
    map['ping']=ping;
    map['longitude']=longitude;
    map['latitude']=latitude;
    map['upload_datasize']=upload_datasize;
    map['download_datasize']=download_datasize;
    map['thread_type']=thread_type;
    map['create_time']=create_time;
    map['note']=note;
    return map;
  }
  static Speedtest fromMap(Map<String,dynamic> map){
    Speedtest speedtest=new Speedtest();
    speedtest.info_id=map['info_id'];
    speedtest.server_name=map['server_name'];
    speedtest.server_ip_address=map['server_ip_address'];
    speedtest.hotspot_name=map['hotspot_name'];
    speedtest.ip_address=map['ip_address'];
    speedtest.network_type=map['network_type'];
    speedtest.download_speed=map['download_speed'];
    speedtest.upload_speed=map['upload_speed'];
    speedtest.loss_rate=map['loss_rate'];
    speedtest.jitter=map['jitter'];
    speedtest.ping=map['ping'];
    speedtest.longitude=map['longitude'];
    speedtest.latitude=map['latitude'];
    speedtest.upload_datasize=map['upload_datasize'];
    speedtest.download_datasize=map['download_datasize'];
    speedtest.thread_type=map['thread_type'];
    speedtest.create_time=map['create_time'];
    speedtest.note=map['note'];
    return speedtest;
  }

  static List<Speedtest> fromMapList(dynamic mapList) {
    List<Speedtest> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  final String tableName = "table_speedtest";
  final String columnInfoid = "info_id";
  final String columnServername = "server_name";
  final String columnServeripaddress = "server_ip_address";
  final String columnHotspotname="hotspot_name";
  final String columnIpaddress="ip_address";
  final String columnNetworktype="network_type";
  final String columnDownloadspeed="download_speed";
  final String columnUploadspeed="upload_speed";
  final String columnLossrate="loss_rate";
  final String columnJitter="jitter";
  final String columnPing="ping";
  final String columnLongitude="longitude";
  final String columnLatitude="latitude";
  final String columnUpLoaddatasize="upload_datasize";
  final String columnDownloaddatasize="download_datasize";
  final String columnThreadtype="thread_type";
  final String columnCreatetime="create_time";
  final String columnNote="note";



  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'sqflite.db');
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  //创建数据库表
  void _onCreate(Database db, int version) async {
    await db.execute(
        "create table $tableName($columnInfoid integer primary key ,$columnServername text not null ,$columnServeripaddress text not null,$columnHotspotname text not null,$columnIpaddress text not null,$columnNetworktype text not null,$columnDownloadspeed integer not null,$columnUploadspeed integer not null,$columnLossrate text not null,$columnJitter integer not null,$columnPing integer not null,$columnLongitude text not null,$columnLatitude text not null,$columnUpLoaddatasize text not null,$columnDownloaddatasize text not null,$columnThreadtype text not null,$columnCreatetime text not null,$columnNote text not null)"
    );
    print("Table is created");
  }

//插入
  Future<int> saveItem(Speedtest speedtest) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", speedtest.toMap());
    print(res.toString());
    return res;
  }

  //查询
  Future<List> getTotalList() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName ");
    return result.toList();
  }

  //查询总数
  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $tableName"
    ));
  }

//按照id查询
  Future<Speedtest> getItem(int info_id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName WHERE info_id = $info_id");
    if (result.length == 0) return null;
    return Speedtest.fromMap(result.first);
  }


  //清空数据
  Future<int> clear() async {
    var dbClient = await db;
    return await dbClient.delete(tableName);
  }


  //根据id删除
  Future<int> deleteItem(int info_id) async {
    var dbClient = await db;
    return await dbClient.delete(tableName,
        where: "$columnInfoid = ?", whereArgs: [info_id]);
  }

  //修改
  Future<int> updateItem(Speedtest speedtest) async {
    var dbClient = await db;
    return await dbClient.update("$tableName", speedtest.toMap(),
        where: "$columnInfoid = ?", whereArgs: [speedtest.info_id]);
  }

  //关闭
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}