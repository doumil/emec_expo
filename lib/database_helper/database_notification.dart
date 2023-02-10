import 'dart:async';
import 'dart:io';
import 'package:emec_expo/main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:emec_expo/model/notification_model.dart';

class DataBaseHelperNotif{
  final String notifTable = 'notificationtable';
   final String columnId='id';
  final String columnName= 'name';
  final String columnDate = 'date';
  final String columnDtime='dtime';
  final String columnDiscription = 'discriptions';
  Future<Database> get db async{
    var _db = await intDB();
    return _db;
  }
  intDB() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path , 'dbNotiF.db');
    var myOwnDB = await openDatabase(path,version: 1,
        onCreate:(Database db , int newVersion) async{
          Batch batch= db.batch();
          var sql1 = "CREATE TABLE $notifTable ("
              "$columnId INTEGER  auto_increment,"
              " $columnName TEXT, "
              "$columnDate DATETIME,"
              "$columnDtime DATETIME,"
              " $columnDiscription TEXT"
              ")";
          db.execute(sql1);
          await  batch.commit();
        });
    return myOwnDB;
  }
  //save notification
  Future<int> saveNoti( NotifClass Noti) async{
    var dbClient = await  db;
    int result = await dbClient.insert("$notifTable", Noti.toMap());
    return result;
  }
  //map by order

  //get list of notifications
  Future<List<NotifClass>> getListNoti() async {
    final dbList = await db;
    final List<Map<String, dynamic>> maps = await dbList.query("$notifTable");
    return List.generate(maps.length, (i) {
      return NotifClass(maps[i]['name'],maps[i]['date'],maps[i]['dtime'],maps[i]['discriptions']);
    });
  }
  // select all notification
  Future<List> getAllNoti() async{
    var dbClient = await  db;
    var sql = "SELECT * FROM $notifTable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }
}