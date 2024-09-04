import 'package:cubit_database_sqflite/modal/student_modal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper dbHelper = DbHelper._();

  late Database database;

  static const String studentTable = 'Student';

  static const String semId = 'id';

  static const String studentName = 'name';
  static const String studentCourse = 'course';
  static const String studentNumber = 'number';

  Future<void> initDb() async {
    String dbPath = await getDatabasesPath();
    String dbName = 'MyDataBase.db';
    String path = join(dbPath, dbName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return db.execute(
          "CREATE TABLE $studentTable($semId INTEGER PRIMARY KEY AUTOINCREMENT,"
          " $studentName TEXT NOT NULL,"
          " $studentCourse TEXT NOT NULL,"
          "$studentNumber TEXT NOT  NULL"
          ")",
        );
      },
    );
  }

  // insert Student
  Future<void> insertStudent(StudentModal studentModal) async {
    Map<String, dynamic> data = studentModal.toJson();
    data.remove('id');
    await database.insert(studentTable, data);
  }

  //get Student
  Future<List<StudentModal>> getAllStudent() async {
    List<Map<String, dynamic>> result = await database.query(studentTable);
    return result.map((e) => StudentModal.fromJson(e)).toList();
  }

  // Update Student
  Future<void> updateStudent(StudentModal student) async {
    Map<String, dynamic> data = student.toJson();
    await database.update(
      studentTable,
      data,
      where: '$semId = ?',
      whereArgs: [student.id],
    );
  }

  //delete Student
  Future<void> deleteStudent(int id) async {
    await database.delete(
      studentTable,
      where: '$semId = ?',
      whereArgs: [id],
    );
  }
}
