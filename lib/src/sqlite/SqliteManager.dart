import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'model/word.dart';

// TODO: FIX English Sqlite Provider
class SqliteManager {
  static Database _database;
  final _databaseName = "learnigo.db";
  final _databaseVersion = 1;

  static final table = 'WordPerson';

  static final columnId = '_id';
  static final columnName = 'word';
  static final columnKnow = 'know';

  SqliteManager._privateConstructor();
  static final SqliteManager instance = SqliteManager._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    print(documentsDirectory);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnKnow INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRaws() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> queryRowKnowCount(bool isKnow) async {
    Database db = await instance.database;
    int _isNumberKnow = isKnow ? 1 : 0;
    final x = (await db.rawQuery(
        "select COUNT($columnKnow) from $table where $columnKnow = $_isNumberKnow "));
    return Sqflite.firstIntValue(x);
  }

  Future<int> queryRowAllCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery("select * from $table  "));
  }

  Future<List<dynamic>> queryRowListKnowDatas(bool isKnow) async {
    Database db = await instance.database;
    int _isNumberKnow = isKnow ? 1 : 0;
    final x = (await db.rawQuery(
        "select $columnName from $table where $columnKnow = $_isNumberKnow "));
    var objectList = x.map((item) {
      return item[columnWord];
    }).toList();
    return objectList;
  }

  Future<bool> queryIsTableHaveData(String data) async {
    Database db = await instance.database;
    final x = (await db
        .rawQuery("select * from $table where $columnName like \'$data\' "));
    return x.length > 0 ? true : false;
  }

  Future<bool> queryUpdateRowItemKnow(String name, bool isKnow) async {
    Database db = await instance.database;
    String _isNumberKnow = (isKnow ? 1 : 0).toString();

    final x = (await db.rawQuery(
        "update $table set $columnKnow = $_isNumberKnow where $columnName =  \'$name\'"));
    return x.length > 0 ? true : false;
  }

// Force clean
  Future<int> delete() async {
    Database db = await instance.database;
    return await db.delete(table);
  }

  Future close() async => _database.close();
}
