import 'dart:async';
import 'package:flutter_diet_planner/models/progress_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // static final _databaseName = 'progress.db';
  // static final _databaseVersion = 1;
  // static final table = 'progress';
  // static final columnId = 'id';
  // static final columnDate = 'date';
  // static final columnWeight = 'weight';
  // static final columnHeight = 'height';

  // DatabaseHelper._privateConstructor();
  // static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // static Database? _database;

  // Future<Database> get database async {
  //   if (_database != null) return _database!;

  //   _database = await _initDatabase();
  //   return _database!;
  // }

  // _initDatabase() async {
  //   Directory documentsDirectory = await getApplicationDocumentsDirectory();
  //   String path = join(documentsDirectory.path, _databaseName);
  //   return await openDatabase(path,
  //       version: _databaseVersion, onCreate: _onCreate);
  // }

  // Future<void> _onCreate(Database db, int version) async {
  //   await db.execute('''
  //     CREATE TABLE $table (
  //       $columnId INTEGER PRIMARY KEY,
  //       $columnDate TEXT NOT NULL,
  //       $columnWeight REAL NOT NULL,
  //       $columnHeight REAL NOT NULL
  //     )
  //     ''');
  // }

  static DatabaseHelper? _databaseHelper;
  static late Database _database;
  final String _tableName = 'progress';

  DatabaseHelper._internal() {
    _databaseHelper = this;
    _initializeDb();
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'progress_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName(
          id INTEGER PRIMARY KEY,
          date TEXT NOT NULL,       
          weight REAL NOT NULL,
          height REAL NOT NULL
          )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertProgress(Progress progress) async {
    final Database db = await database;
    await db.insert(_tableName, progress.toMap());
  }

  Future<List<Progress>> getProgress() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => Progress.fromMap(e)).toList();
  }

  Future<void> updateProgress(Progress progress) async {
    final db = await database;
    await db.update(
      _tableName,
      progress.toMap(),
      where: 'id = ?',
      whereArgs: [progress.id],
    );
  }

  Future<void> deteleProgress(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
