import 'package:digital_marketing_stratergy/model/seo_database_taskmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/seo_statergy_model.dart';
import '../model/statergy_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE businessdata (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        businessName TEXT,
        websiteUrl TEXT,
        aboutBrand TEXT,
        businessCategory TEXT,
        audienceType TEXT,
        targetLocation TEXT,
        linkedinUrl TEXT,
        facebookUrl TEXT,
        gmbUrl TEXT,
        instagramUrl TEXT

      )
    ''');
    await db.execute('''
      CREATE TABLE statergydata (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        content TEXT,
        totaltask TEXT,
        completedtask TEXT,
        snumber INTEGER

        
      )
    ''');

    await db.execute('''
      CREATE TABLE seotask (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        snumber INTEGER,
        taskname TEXT,
        insturctions TEXT,
        iscompleted TEXT,
        date TEXT,
        category TEXT,
        type TEXT,
        businessid INTEGER
        
        
      )
    ''');
  }

  // CRUD Methods:

  Future<int> insertbusinessdata(StrategyInputModel item) async {
    final db = await database;
    return await db.insert('businessdata', item.toJson());
  }

  Future<List<Map<String, dynamic>>> getbusinessdata() async {
    final db = await database;
    return await db.query('businessdata');
  }

  Future<int> updateItem(Map<String, dynamic> item) async {
    final db = await database;
    return await db.update('items', item, where: 'id = ?', whereArgs: [item['id']]);
  }

  Future<int> deleteBusinessdata(int id) async {
    final db = await database;
    return await db.delete('businessdata', where: 'id = ?', whereArgs: [id]);
  }
// statergy
  Future<int> insertstatergydata(StrategyModel item) async {
    final db = await database;
    return await db.insert('statergydata', item.toJson());
  }

  Future<List<Map<String, dynamic>>> getstatergydata() async {
    final db = await database;
    return await db.query('statergydata');
  }

  //seotask 
  
  Future<int> insertseotaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('seotask', item.toJson());
  }

  Future<List<Map<String, dynamic>>> getseodata() async {
    final db = await database;
    return await db.query('seotask');
  }

  Future<int> updateseotask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('seotask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getSeoTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'seotask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

Future<List<Map<String, dynamic>>> getSeoTaskById(String id) async {
  final db = await database;
  return await db.query(
    'seotask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


}
