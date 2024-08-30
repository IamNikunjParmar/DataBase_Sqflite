import 'package:bloc_database_multi_table/modal/student_modal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modal/professor_modal.dart';

class ProfessorRepo {
  ProfessorRepo._();

  static final ProfessorRepo professorRepo = ProfessorRepo._();

  late Database database;

  static const String professorTable = 'Professor';
  static const String studentTable = 'Student';

  static const String semId = 'id';

  // PROFESSOR TABLE
  static const String professorName = 'name';
  static const String professorSubject = 'subject';
  static const String professorNumber = 'number';

  //Student Table
  static const String studentName = 'name';
  static const String studentEmail = 'email';
  static const String studentNumber = 'number';
  static const String colProfessorId = 'professorId';

  Future<void> initDb() async {
    String dbPath = await getDatabasesPath();
    String dbName = 'myDataBase.db';
    String path = join(dbPath + dbName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $professorTable(
        $semId INTEGER PRIMARY KEY AUTOINCREMENT,
        $professorName TEXT NOT NULL,
        $professorSubject TEXT NOT NULL,
        $professorNumber TEXT NOT NULL
        )
        ''');
        await db.execute('''
        CREATE TABLE $studentTable(
        $semId INTEGER PRIMARY KEY AUTOINCREMENT,
        $studentName TEXT NOT NULL,
        $studentEmail TEXT NOT NULL,
        $studentNumber TEXT NOT NULL,
        $colProfessorId TEXT,
         FOREIGN KEY ($colProfessorId) REFERENCES $professorTable($semId)
        )
        ''');
      },
    );
  }

// Insert Professor
  Future<void> insertProfessor(ProfessorModal professorModal) async {
    Map<String, dynamic> data = professorModal.toMap();
    data.remove('id');
    await database.insert(professorTable, data);
  }

// Get Professor
  Future<List<ProfessorModal>> getAllProfessor() async {
    List<Map<String, dynamic>> result = await database.query(professorTable);
    return result.map((e) => ProfessorModal.fromMap(data: e)).toList();
  }

  //Insert Student
  Future<void> insertStudent(StudentModal studentModal) async {
    Map<String, dynamic> data = studentModal.toMap();
    data.remove('id');
    await database.insert(studentTable, data);
  }

  // Get Student
  Future<List<StudentModal>> getAllStudent() async {
    List<Map<String, dynamic>> result = await database.query(studentTable);
    return result.map((e) => StudentModal.fromMap(data: e)).toList();
  }

  //delete Student
  Future<void> deleteStudent(int id) async {
    await database.delete(
      studentTable,
      where: '$semId = ?',
      whereArgs: [id],
    );
  }

  //Update Student
  Future<void> updateStudent(StudentModal studentModal) async {
    Map<String, dynamic> data = studentModal.toMap();
    await database.update(
      studentTable,
      data,
      where: '$semId = ?',
      whereArgs: [studentModal.id],
    );
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
