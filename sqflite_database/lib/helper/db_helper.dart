import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_database/model/emp_model.dart';

class DbHelper {
  DbHelper._();

  static final DbHelper dbHelper = DbHelper._();
  late Database database;

  // Table and column names
  static const String empTable = "Employee";
  static const String colId = 'id';
  static const String colName = 'name';
  static const String colAge = 'age';

  // Initialize database
  Future<void> initDb() async {
    String dbPath = await getDatabasesPath();
    String dbName = 'MyDatabase.db';
    String path = join(dbPath, dbName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $empTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT NOT NULL, $colAge INTEGER NOT NULL)",
        );
      },
    );
  }

  // Insert data into Employee table
  Future<void> insertDb({required EmployeeModel employeeModel}) async {
    Map<String, dynamic> data = employeeModel.toMap();
    data.remove('id');

    await database.insert(empTable, data);
  }

  // Update data in Employee table
  Future<void> updateDb({required EmployeeModel employeeModel}) async {
    await database.update(
      empTable,
      employeeModel.toMap(),
      where: '$colId = ?',
      whereArgs: [employeeModel.id],
    );
  }

  // Delete data from Employee table
  Future<int> deleteDb({required int id}) async {
    return await database.delete(
      empTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
  }

  // Retrieve all data from Employee table
  Future<List<EmployeeModel>> getData() async {
    await initDb(); // database initialized
    List<Map<String, dynamic>> result = await database.query(empTable);
    return result.map((e) => EmployeeModel.fromMap(data: e)).toList();
  }
}
