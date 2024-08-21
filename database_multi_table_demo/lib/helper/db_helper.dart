import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modal/professor_modal.dart';
import '../modal/student_modal.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper dbHelper = DbHelper._();

  late Database database;

  static const String professorTable = 'Professor';
  static const String studentTable = 'Student';

  static const String colId = 'id';

  // PROFESSOR TABLE
  static const String colProfessorName = 'name';
  static const String colProfessorSubject = 'subject';
  static const String colProfessorNumber = 'number';

  // STUDENT TABLE
  static const String colStudentName = 'name';
  static const String colStudentEmail = 'email';
  static const String colStudentNumber = 'number';
  static const String colProfessorId = 'professorId';

  Future<void> initDb() async {
    String dbName = 'MyDatabase.db';
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $professorTable(
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colProfessorName TEXT NOT NULL,
        $colProfessorSubject TEXT NOT NULL,
        $colProfessorNumber TEXT NOT NULL
        )
        ''');
        await db.execute('''
        CREATE TABLE $studentTable(
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colStudentName TEXT NOT NULL,
        $colStudentEmail TEXT NOT NULL,
        $colStudentNumber TEXT NOT NULL,
        $colProfessorId TEXT ,
        FOREIGN KEY ($colProfessorId) REFERENCES $professorTable($colId)
        )
        ''');
      },
    );
  }

  Future<void> insertProfessor(ProfessorModal professorModal) async {
    Map<String, dynamic> data = professorModal.toMap();
    data.remove('id');
    await database.insert(professorTable, data);
  }

  Future<void> insertStudent(StudentModal studentModal) async {
    Map<String, dynamic> data = studentModal.toMap();
    data.remove('id');
    await database.insert(studentTable, data);
  }

  Future<void> updateStudent(StudentModal studentModal) async {
    Map<String, dynamic> data = studentModal.toMap();
    await database.update(
      studentTable,
      data,
      where: '$colId = ?',
      whereArgs: [studentModal.id],
    );
  }

  Future<void> deleteStudent(int id) async {
    await database.delete(
      studentTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
  }

  Future<List<ProfessorModal>> getAllProfessor() async {
    List<Map<String, dynamic>> result = await database.query(professorTable);
    return result.map((e) => ProfessorModal.fromMap(data: e)).toList();
  }

  Future<List<StudentModal>> getAllStudent() async {
    List<Map<String, dynamic>> result = await database.query(studentTable);
    return result.map((e) => StudentModal.fromMap(data: e)).toList();
  }

  Future<List<StudentModal>> getStudentByProfessor(String professorId) async {
    List<Map<String, dynamic>> result = await database.query(
      studentTable,
      where: '$colProfessorId = ?',
      whereArgs: [professorId],
    );
    return result.map((e) => StudentModal.fromMap(data: e)).toList();
  }
}
