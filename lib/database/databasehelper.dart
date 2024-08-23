

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/requests.dart';


class DatabaseHelper{

  static const String _tableName = 'OwnPostItem';
  static const int _databaseVersion = 1;

  static const id ='id';
  static const title ='title';
  static const description ='description';
  static const descriptionOld ='description_old';
  static const createdAt ='createdAt';
  static const updatedAt ='updatedAt';
  static const requestedBy ='requestedby';
  static const requestFile ='requestFile';
  static const attachFile ='attachFile';
  static const make ='make';
  static const model ='model';
  static const yearOfMake ='yearofmake';
  static const faultCode ='faultCode';
  static const isSolved ='isSolved';
  static const registrationNumber ='registrationnumber';
  static const issueResponsesCount ='issueResponsesCount';
  static const message ='message';
  static Database? _database;

 static Future<void>  initDB() async {
   const String dbName = 'OwnPostItem.db';
   final dbExists = await databaseExists(dbName);

   if(!dbExists){
     print("Database does not exist. Creating a new one...");
     _database = await openDatabase(
       dbName,
       version: _databaseVersion,
       onCreate: _onCreate
     );
     print("Database created successfully.");
   }else{
     print("Database already exists. Opening the database...");
     _database = await openDatabase(dbName);
   }

  }

 static Future _onCreate(Database db, int version) async{
    await db.execute('''
    CREATE TABLE $_tableName (
          $id INTEGER NOT NULL PRIMARY KEY,
          $title VARCHAR,
          $description VARCHAR,
          $createdAt VARCHAR,
          $requestFile VARCHAR,
          $make VARCHAR,
          $model VARCHAR,
          $yearOfMake VARCHAR,
          $faultCode VARCHAR  ,
          $registrationNumber VARCHAR,
          $isSolved VARCHAR,
          $message VARCHAR,
        )
        ''');
  }

static Future insertItem(Requests requests) async {
    final db = _database;
    return await db?.insert(_tableName, requests.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

/*    if(existingData?.isEmpty ?? true){
       await db?.insert(
          _tableName, {
        'id': requests.id,
        'title': requests.title,
        'description': requests.description,
        'created_at': requests.createdAt,
        'requestFile': requests.requestFile,
        'make': requests.make,
        'model': requests.model,
        'yearofmake': requests.yearofmake,
        'faultCode': requests.faultCode,
        'registrationnumber': requests.registrationnumber,
        'isSolved': isSolved,
        'message': message,

      },
          conflictAlgorithm: ConflictAlgorithm.replace
      );
    }*/
  }
  // Delete all
  Future  deleteData() async {
    final db = _database;
    final res = await db?.delete(_tableName);

    return res;
  }


 static Future<List<Map<String,dynamic>>>  getUserData() async {
    var db = await _database;
    final List<Map<String,dynamic>>  data = await db!.query(_tableName);
    return data;
  }

  static Future<void> close() async{
   final db = await _database;
   await db?.close();
   print("Database closed.");
  }




}