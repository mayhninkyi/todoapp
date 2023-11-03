import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/task.dart';


class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('Already created!');
      return;
    }
    try {
      final path = '${await getDatabasesPath()}tasks.db';
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, ver) {
          debugPrint('Creating a new one');
          return db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title STRING,note TEXT, date STRING, "
            "color INREGER,"
            "isCompleted INTEGER)",
          );
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<int> insert(Task? task) async {
    return await _db!.insert(_tableName, task!.toJson());
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableName);
  }

  static delete(Task _) async {
    return await _db?.delete(_tableName, where: 'id=?', whereArgs: [_.id]);
    
  }

  static update(int id) async {
    return await _db!.rawUpdate('''
        UPDATE  $_tableName SET isCompleted = ?
        WHERE id = ?
        ''', [1, id]);
  }
}
