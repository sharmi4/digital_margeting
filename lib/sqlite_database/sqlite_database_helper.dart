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

      await db.execute('''
      CREATE TABLE sxotask (
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
      CREATE TABLE cmtask (
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
      CREATE TABLE emtask (
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
      CREATE TABLE imtask (
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
      CREATE TABLE amtask (
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
      CREATE TABLE vmtask (
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
      CREATE TABLE mmtask (
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
      CREATE TABLE ormtask (
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
      CREATE TABLE crotask (
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
      CREATE TABLE wattask (
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
      CREATE TABLE ppctask (
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
      CREATE TABLE patask (
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
      CREATE TABLE rrtask (
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
      CREATE TABLE lstask (
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
      CREATE TABLE vsotask (
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
      CREATE TABLE matask (
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
      CREATE TABLE chatbotmtask (
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
      CREATE TABLE communitymtask (
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
      CREATE TABLE dptask (
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
      CREATE TABLE wvemtask (
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
      CREATE TABLE swmtask (
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
      CREATE TABLE lpotask (
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
      CREATE TABLE fbaotask (
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

//aio

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

//sxo

Future<int> insertSXOtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('sxotask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getSXOdata() async {
    final db = await database;
    return await db.query('sxotask');
  }

  Future<int> updateSXOtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('sxotask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getSXOTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'sxotask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getSXOTaskById(String id) async {
  final db = await database;
  return await db.query(
    'sxotask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//CM

Future<int> insertCMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('cmtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getCMdata() async {
    final db = await database;
    return await db.query('cmtask');
  }

  Future<int> updateCMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('cmtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getCMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'cmtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getCMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'cmtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//EM

Future<int> insertEMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('emtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getEMdata() async {
    final db = await database;
    return await db.query('emtask');
  }

  Future<int> updateEMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('emtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getEMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'emtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getEMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'emtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//IM

Future<int> insertIMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('imtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getIMdata() async {
    final db = await database;
    return await db.query('imtask');
  }

  Future<int> updateIMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('imtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getIMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'imtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getIMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'imtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//AM

Future<int> insertAMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('amtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getAMdata() async {
    final db = await database;
    return await db.query('amtask');
  }

  Future<int> updateAMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('amtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getAMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'amtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getAMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'amtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


//VM

Future<int> insertVMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('vmtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getVMdata() async {
    final db = await database;
    return await db.query('vmtask');
  }

  Future<int> updateVMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('vmtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getVMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'vmtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getVMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'vmtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//MM

Future<int> insertMMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('mmtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getMMdata() async {
    final db = await database;
    return await db.query('mmtask');
  }

  Future<int> updateMMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('mmtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getMMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'mmtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getMMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'mmtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//ORM

Future<int> insertORMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('ormtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getORMdata() async {
    final db = await database;
    return await db.query('ormtask');
  }

  Future<int> updateORMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('ormtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getORMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'ormtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getORMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'ormtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


//CRO

Future<int> insertCROtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('crotask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getCROdata() async {
    final db = await database;
    return await db.query('crotask');
  }

  Future<int> updateCROtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('crotask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getCROTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'crotask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getCROTaskById(String id) async {
  final db = await database;
  return await db.query(
    'crotask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


//WAT

Future<int> insertWATtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('wattask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getWATdata() async {
    final db = await database;
    return await db.query('wattask');
  }

  Future<int> updateWATtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('wattask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getWATTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'wattask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getWATTaskById(String id) async {
  final db = await database;
  return await db.query(
    'wattask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//PPC

Future<int> insertPPCtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('ppctask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getPPCdata() async {
    final db = await database;
    return await db.query('ppctask');
  }

  Future<int> updatePPCtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('ppctask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getPPCTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'ppctask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getPPCTaskById(String id) async {
  final db = await database;
  return await db.query(
    'ppctask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


//PA

Future<int> insertPAtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('patask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getPAdata() async {
    final db = await database;
    return await db.query('patask');
  }

  Future<int> updatePAtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('patask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getPATaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'patask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getPATaskById(String id) async {
  final db = await database;
  return await db.query(
    'patask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


//RR

Future<int> insertRRtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('rrtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getRRdata() async {
    final db = await database;
    return await db.query('rrtask');
  }

  Future<int> updateRRtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('rrtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getRRTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'rrtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getRRTaskById(String id) async {
  final db = await database;
  return await db.query(
    'rrtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//LS

Future<int> insertLStaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('lstask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getLSdata() async {
    final db = await database;
    return await db.query('lstask');
  }

  Future<int> updateLStask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('lstask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getLSTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'lstask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getLSTaskById(String id) async {
  final db = await database;
  return await db.query(
    'lstask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


//VSO

Future<int> insertVSOtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('vsotask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getVSOdata() async {
    final db = await database;
    return await db.query('vsotask');
  }

  Future<int> updateVSOtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('vsotask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getVSOTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'vsotask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getVSOTaskById(String id) async {
  final db = await database;
  return await db.query(
    'vsotask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


//MA

Future<int> insertMAtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('matask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getMAdata() async {
    final db = await database;
    return await db.query('matask');
  }

  Future<int> updateMAtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('matask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getMATaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'matask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getMATaskById(String id) async {
  final db = await database;
  return await db.query(
    'matask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//CHATM

Future<int> insertCHATMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('chatbotmtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getCHATMdata() async {
    final db = await database;
    return await db.query('chatbotmtask');
  }

  Future<int> updateCHATMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('chatbotmtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getCHATMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'chatbotmtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getCHATMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'chatbotmtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//COMMU M

Future<int> insertCOMMUMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('communitymtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getCOMMUMdata() async {
    final db = await database;
    return await db.query('communitymtask');
  }

  Future<int> updateCOMMUMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('communitymtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getCOMMUMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'communitymtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getCOMMUMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'communitymtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


//DP

Future<int> insertDPtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('dptask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getDPdata() async {
    final db = await database;
    return await db.query('dptask');
  }

  Future<int> updateDPtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('dptask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getDPTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'dptask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getDPTaskById(String id) async {
  final db = await database;
  return await db.query(
    'dptask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


//WVEM

Future<int> insertWVEMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('wvemtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getWVEMdata() async {
    final db = await database;
    return await db.query('wvemtask');
  }

  Future<int> updateWVEMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('wvemtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getWVEMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'wvemtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getWVEMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'wvemtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//SWM

Future<int> insertSWMtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('swmtask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getSWMdata() async {
    final db = await database;
    return await db.query('swmtask');
  }

  Future<int> updateSWMtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('swmtask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getSWMTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'swmtask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getSWMTaskById(String id) async {
  final db = await database;
  return await db.query(
    'swmtask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

//LPO

Future<int> insertLPOtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('lpotask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getLPOdata() async {
    final db = await database;
    return await db.query('lpotask');
  }

  Future<int> updateLPOtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('lpotask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getLPOTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'lpotask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getLPOTaskById(String id) async {
  final db = await database;
  return await db.query(
    'lpotask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}


//FBAO

Future<int> insertFBAOtaskdata(SeoTaskModel item) async {
    final db = await database;
    return await db.insert('fbaotask', item.toJson());
  }


 Future<List<Map<String, dynamic>>> getFBAOdata() async {
    final db = await database;
    return await db.query('fbaotask');
  }

  Future<int> updateFBAOtask(SeoTaskModel item) async {
    final db = await database;
    return await db.update('fbaotask', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Map<String, dynamic>>> getFBAOTaskByDate(String date) async {
    final db = await database;
    return await db.query(
      'fbaotask',
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  Future<List<Map<String, dynamic>>> getFBAOTaskById(String id) async {
  final db = await database;
  return await db.query(
    'fbaotask',
    where: 'businessid = ?',
    whereArgs: [id],
    orderBy: 'date ASC', // always ascending
  );
}

}
