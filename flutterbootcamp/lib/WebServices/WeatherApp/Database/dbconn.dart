import 'dart:async';
import 'package:flutterbootcamp/WebServices/WeatherApp/model/WeatherData.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbConn {

  Database? database;

  Future initDB() async {
    if (database != null) {
      return database;
    }
    String databasesPath = await getDatabasesPath();
    database = await openDatabase(
      join(databasesPath, 'weather.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE weather(id INTEGER PRIMARY KEY, country TEXT, weathermain TEXT, temperature TEXT,icon TEXT)",
        );
      },
      version: 1,
    );
    return database;
  }
  void insertBooks(WeatherData weatherdata) async {
    final Database db = database!;

    db.insert(
      'weatherdata',
      weatherdata.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
