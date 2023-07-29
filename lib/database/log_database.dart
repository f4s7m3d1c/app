import 'dart:async';

import 'package:sqflite/sqflite.dart';

class LogDB {
  static LogDB? _instance;

  final Database db;

  LogDB({required this.db}){
    _instance = this;
  }

  factory LogDB.init(Database db) {
    final completer = Completer();
    db.execute("").then(
      (value) => completer.complete(),
    );
    while(!completer.isCompleted){
      // waiting
    }
    return LogDB(db: db);
  }

  factory LogDB.getInstance() {
    return LogDB._instance!;
  }

  Future<void> addLog(String korKeyword, String desc, String result) async {

  }
}