import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBS {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(path.join(dbPath, 'main.db'),
        onCreate: (db, version) {
      db.execute(
        'CREATE TABLE favorites(id TEXT PRIMARY KEY, name TEXT, description TEXT, image_url TEXT, lat INT, lon INT)',
      );
      db.execute(
        'CREATE TABLE visited(id TEXT PRIMARY KEY, name TEXT, description TEXT, image_url TEXT, lat INT, lon INT)',
      );
    }, version: 1);
  }

  static Future<List<Map<String, dynamic>>> getDB(
    String table,
  ) async {
    final db = await DBS.database();
    return db.query(table);
  }

  static Future<void> insert(
    String table,
    Map<String, dynamic> data,
    String name,
    String list,
    BuildContext context,
  ) async {
    final db = await DBS.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    Flushbar(
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarStyle: FlushbarStyle.FLOATING,
      isDismissible: true,
      icon: Icon(
        Icons.add_location,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      title: '$list',
      message: '$name is added to $list',
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Theme.of(context).primaryColor,
      forwardAnimationCurve: Curves.easeInOutCubic,
      reverseAnimationCurve: Curves.easeOutCubic,
      maxWidth: 500,
      margin: EdgeInsets.all(
        20,
      ),
    )..show(context);
  }

  static Future<void> delete(
    String table,
    String id,
    String name,
    String list,
    BuildContext context,
  ) async {
    final db = await DBS.database();
    db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
    Flushbar(
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarStyle: FlushbarStyle.FLOATING,
      isDismissible: true,
      icon: Icon(
        Icons.delete_sweep,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      title: '$list',
      message: '$name is deleted from $list',
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Theme.of(context).primaryColor,
      forwardAnimationCurve: Curves.easeInOutCubic,
      reverseAnimationCurve: Curves.easeOutCubic,
      maxWidth: 500,
      margin: EdgeInsets.all(
        20,
      ),
    )..show(context);
  }

  static Future<int> countItems(
    String table,
  ) async {
    final db = await DBS.database();
    final count = sql.Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
    return count;
  }

  static Future<List<Map<String, dynamic>>> exists(
    String table,
    String id,
  ) async {
    final db = await DBS.database();

    var result = await db.query(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  static Future<void> insertOrDelete() async {}
}
