import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/*
   * Author: Karim Mohamed
   * Email: karimmohamed200510@gmail.com
   * Function: Read From Sqlite File
*/
class DBHelper {
  static Database dbInstance;

  Future<Database> get db async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "copy_asset.db");

    await deleteDatabase(path);

    ByteData data =
        await rootBundle.load(join("assets", 'db', "halaqat.sqlite"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);

    var db = await openDatabase(path, readOnly: true);

    return db;
  }

  Future getSuraTable() async {
    var dbConnection = await db;
    List<Map> list = await dbConnection.query('Sura');
    return list.toList();
  }
}
