import 'dart:async';

import 'package:fastmedic/utils/date.dart';
import 'package:sqflite/sqflite.dart';

class LogDB {
  static LogDB? _instance;

  final Database db;

  LogDB({required this.db}){
    _instance = this;
  }

  factory LogDB.init(Database db) {
    return LogDB(db: db);
  }

  factory LogDB.getInstance() {
    return LogDB._instance!;
  }

  Future<void> addLog(String korKeyword, String desc, String result) async {
    db.insert(
      "sick_search_db",
      {
        "date": dateFormat(DateTime.now()),
        "sicks": korKeyword,
        "desc": desc,
        "result": result
      },
    );
  }
}