import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'cancer.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  void _createDatabase(Database db, int version) async {
    await db.execute('''CREATE TABLE forum (
          id INTEGER PRIMARY KEY, name TEXT,age TEXT, weight TEXT, height TEXT, BSA TEXT, gender TEXT, smoke TEXT, date TEXT
          )''');
    await db.execute('''CREATE TABLE Tumor (
      id INTEGER PRIMARY KEY, name TEXT, one TEXT, two TEXT, three TEXT, four TEXT, five TEXT
      )''');
  }
}
