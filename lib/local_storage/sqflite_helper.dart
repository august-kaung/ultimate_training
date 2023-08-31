import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ultimate_training/vos/student_vo.dart';


import '../vos/teacher_vo.dart';

class SqlHelper {
  late Database _studentDatabase;
  late Database _teacherDatabase;
  String tbStudentName = 'StudentTable';
  String tbTeacherName = 'TeacherTable';

  Future<Database> createStudentDataBase() async {
    var folderPath = await getDatabasesPath();
    var filePath = join(folderPath, 'student.db');
    _studentDatabase = await openDatabase(filePath);

    await _studentDatabase.execute(
        'CREATE TABLE IF NOT EXISTS $tbStudentName (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, gender TEXT , teacherId INT)');
    return _studentDatabase;
  }

  Future<Database> createTeacherDataBase() async {
    var folderPath = await getDatabasesPath();
    var filePath = join(folderPath, 'teacher.db');
    _teacherDatabase = await openDatabase(filePath);

    await _teacherDatabase.execute(
        'CREATE TABLE IF NOT EXISTS $tbTeacherName (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT )');
    return _teacherDatabase;
  }

  Future<List<StudentVO>> getAllStudent() async {
    Database studentDb = await SqlHelper().createStudentDataBase();
    List<Map> result = [];
    //result=await studentDb.query('$studentDb',columns: ['id','name','age','gender','teacherId']);

    await studentDb.transaction((txn) async {
      result = await txn.query(
        tbStudentName,
        columns: ["id", "name", "age", "gender", "teacherId"],
      );
    });

    return result.map((e) => StudentVO.fromJson(e)).toList();
  }

  Future<List<TeacherVO>> getAllTeacher() async {
    Database teacherDb = await SqlHelper().createTeacherDataBase();
    List<Map> result = [];
    //result=await studentDb.query('$studentDb',columns: ['id','name','age','gender','teacherId']);

    await teacherDb.transaction((txn) async {
      result = await txn.query(
        tbTeacherName,
        columns: ["id", "name"],
      );
    });

    return result.map((e) => TeacherVO.fromJson(e)).toList();
  }

  Future<List<StudentVO>> getStudentById(int id) async {
    Database studentDb = await SqlHelper().createStudentDataBase();
    List<Map> result = [];
    await studentDb.transaction((txn) async {
      result = await txn.query(tbStudentName,
          columns: ["id", "name", "age", "gender", "teacherId"],
          where: "id = ?",
          whereArgs: [id]);
    });

    return result.map((e) => StudentVO.fromJson(e)).toList();
  }

  Future<List<TeacherVO>> getTeacherById(int id) async {
    Database teacherDb = await SqlHelper().createTeacherDataBase();
    List<Map> result = [];
    await teacherDb.transaction((txn) async {
      result = await txn.query(tbTeacherName,
          columns: ["id", "name"], where: "id = ?", whereArgs: [id]);
    });

    return result.map((e) => TeacherVO.fromJson(e)).toList();
  }

  Future<int>addStudent(StudentVO student)async{
    Database studentDb = await SqlHelper().createStudentDataBase();
    return studentDb.insert(tbStudentName, student.toJson());
  }
  Future<int>addTeacher(TeacherVO teacher)async{
    Database teacherDb = await SqlHelper().createTeacherDataBase();
    return await teacherDb.insert(tbTeacherName, teacher.toJson());
  }

  Future<int>updateTeacher(TeacherVO teacher,int id)async{
    Database teacherDb = await SqlHelper().createTeacherDataBase();
    return await teacherDb.update(tbTeacherName, teacher.toJson() ,where: 'id=?',whereArgs: [id]);
  }
  Future<int>updateStudent(StudentVO student,int id)async{
    Database db = await SqlHelper().createStudentDataBase();
    return await db.update(tbStudentName, student.toJson(),where: 'id=?',whereArgs: [id]);
  }

  Future<int>deleteStudent(int id)async{
    Database db = await SqlHelper().createStudentDataBase();
    return await db.delete(tbStudentName,where: 'id=?',whereArgs: [id]);
  }
  Future<int>deleteTeacher(int id)async{
    Database db = await SqlHelper().createTeacherDataBase();
    return await db.delete(tbTeacherName,where: 'id=?',whereArgs: [id]);
  }
}
