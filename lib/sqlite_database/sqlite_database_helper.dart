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
    await db.execute('''
      CREATE TABLE semtask (
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
    await db.execute('''
      CREATE TABLE smmtask (
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
    await db.execute('''
      CREATE TABLE aeotask (
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

    await db.execute('''
      CREATE TABLE geotask (
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

    await db.execute('''
      CREATE TABLE aiotask (
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

//SEM Task

Future<int> insertSEMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('semtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getSEMdata() async {
    final db = await database;
    return await db.query('semtask');
  }

  Future<int> updateSEMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('semtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getSEMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'semtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getSEMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'semtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//smm

Future<int> insertSMMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('smmtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getSMMdata() async {
    final db = await database;
    return await db.query('smmtask');
  }

  Future<int> updateSMMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('smmtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getSMMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'smmtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getSMMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'smmtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//aeo

Future<int> insertAEOtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('aeotask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getAEOdata() async {
    final db = await database;
    return await db.query('aeotask');
  }

  Future<int> updateAEOtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('aeotask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getAEOTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'aeotask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getAEOTaskById(String id) async {
  final db = await database;
  return await db.query(
    'aeotask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


//geo

Future<int> insertGEOtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('geotask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getGEOdata() async {
    final db = await database;
    return await db.query('geotask');
  }

  Future<int> updateGEOtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('geotask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getGEOTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'geotask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getGEOTaskById(String id) async {
  final db = await database;
  return await db.query(
    'geotask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//aeo

Future<int> insertAIOtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('aiotask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getAIOdata() async {
    final db = await database;
    return await db.query('aiotask');
  }

  Future<int> updateAIOtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('aiotask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getAIOTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'aiotask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getAIOTaskById(String id) async {
  final db = await database;
  return await db.query(
    'aiotask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

}
