import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:professor/database/student.dart';
import 'package:professor/database/student_score.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance =  DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableUser = "userTable";
  final String columnId = "id";
  final String columnName = "name";
  final String columnPhone = "phone";
  final String columnAddress = "address";
  final String columnGroup = "groupnum";
  final String tableScores = "scores";
  final String colStudentId = "studentid";
  final String colMonth = "monthnum";
  final String colSession = "sessionnum";
  final String colPresence = "presence";
  final String colSheet = "sheet" ;
  final String colExam = "exam";
  final String colBonus = "Bonus";


  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      print('database!=null');
      return _db;
    }
    print('database=null');
    _db = await initDb();

    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(
        documentDirectory.path, "maindb.db"); //home://directory/files/maindb.db
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  /*
     id | username | password
     ------------------------
     1  | Paulo    | paulo
     2  | James    | bond
   */

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tableUser($columnId INTEGER PRIMARY KEY, $columnName TEXT, $columnPhone TEXT, $columnAddress TEXT, $columnGroup INTEGER)");
  }

  //CRUD - CREATE, READ, UPDATE , DELETE

  //Insertion
  Future<int> saveStudent(Student student) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableUser", student.toMap());
    return res;
  }

  //Get Users
   Future<List> getAllStudents() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableUser");

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableUser"));
  }

  Future<List<Map<String,dynamic>>> getStudent(int num) async {
    var dbClient = await db;

    var result = await dbClient.rawQuery("SELECT * FROM $tableUser WHERE $columnGroup = $num");
    print(result);
    return  result;
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;

    return await dbClient.delete(tableUser,
        where: "$columnId = ?", whereArgs: [id]);
  }


  Future<int> updateUser(Student student) async {
    var dbClient = await db;
    return await dbClient.update(tableUser,
        student.toMap(), where: "$columnId = ?", whereArgs: [student.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
  createScoreTable() async{
    var dbClient = await db;
    dbClient.execute("CREATE TABLE IF NOT EXISTS $tableScores ($colStudentId INTEGER , $colMonth INTEGER , $colSession INTEGER , $colPresence INTEGER , $colSheet INTEGER, $colExam INTEGER, $colBonus INTEGER , PRIMARY KEY ($colStudentId,$colMonth,$colSession))");
  }
  Future<int> saveScore(Scores scores) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableScores", scores.toMap());
    return res;
  }

}
