import 'dart:async';

import 'package:fastmedic/models/log.dart';
import 'package:fastmedic/utils/date.dart';
import 'package:sqflite/sqflite.dart';

class LogDB {

  static LogDB? _instance;

  static LogDB get instance => _instance!;

  final Database db;

  LogDB({required this.db}){
    _instance = this;
  }

  factory LogDB.init(Database db) {
    return LogDB(db: db);
  }

  Future<void> addLog(String korKeyword, String desc, String result) async {
    await db.insert(
      "sick_search_db",
      {
        "date": dateFormat(DateTime.now()),
        "sicks": korKeyword,
        "desc": desc,
        "result": result
      },
    );
  }

  Future<List<Log>> getLogs() async {
    List<Log> logs = [];
    List<Map> rows = await db.rawQuery("SELECT * From `sick_search_db`;");
    for (var map in rows) {
      logs.add(Log(
        id: map["id"],
        date: map["date"],
        keywords: map["sicks"],
        description: map["desc"],
        result: map["result"],
      ));
    }
    return logs;
  }

  Future<void> removeLog(int id) async{
    await db.delete(
      "sick_search_db",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}