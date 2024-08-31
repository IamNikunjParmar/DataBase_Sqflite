import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_multi_table/modal/db_modal.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper dbHelper = DbHelper._();

  late Database database;

  // Table 1
  static const String tableName1 = 'MyTable1';
  static const String colId1 = 'id';
  static const String colName1 = 'name';
  static const String colCompanyName1 = 'companyName';

  Future<void> initDb() async {
    String dbName = "MyDatabase.db";
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute("""
          CREATE TABLE $tableName1 (
            $colId1 INTEGER PRIMARY KEY AUTOINCREMENT,
            $colName1 TEXT NOT NULL,
            $colCompanyName1 TEXT NOT NULL
          )
        """);
      },
    );
  }

  Future<void> insertData1({required EmpModal empModal}) async {
    Map<String, dynamic> data = empModal.toMap();
    data.remove('id');
    await database.insert(tableName1, data);
  }

  Future<List<EmpModal>> getData1() async {
    List<Map<String, dynamic>> result = await database.query(tableName1);
    return result.map((e) => EmpModal.fromMap(data: e)).toList();
  }

  Future<List<EmpModal>> getDataByCompanyName(String companyName) async {
    List<Map<String, dynamic>> result = await database.query(
      tableName1,
      where: '$colCompanyName1 = ?',
      whereArgs: [companyName],
    );
    return result.map((e) => EmpModal.fromMap(data: e)).toList();
  }
}
