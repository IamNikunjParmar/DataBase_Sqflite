import 'package:flutter/foundation.dart';
import 'package:sqflite_database/helper/db_helper.dart';

import '../model/emp_model.dart';

class DbController extends ChangeNotifier {
  List<EmployeeModel> allData = [];

  DbController() {
    init();
  }

  //getData fir init
  Future<void> init() async {
    allData = await DbHelper.dbHelper.getData();
    notifyListeners();
  }

  // Add to Employee
  Future<void> addEmployee({required EmployeeModel employeeModel}) async {
    await DbHelper.dbHelper.insertDb(employeeModel: employeeModel).then((value) => init());
    notifyListeners();
  }

  //Update Employee
  Future<void> updateEmployee({required EmployeeModel employeeModel}) async {
    await DbHelper.dbHelper.updateDb(employeeModel: employeeModel).then((value) => init());
    notifyListeners();
  }

  //Delete to Employee
  Future<void> deleteEmployee({required EmployeeModel employeeModel}) async {
    await DbHelper.dbHelper.deleteDb(id: employeeModel.id).then((value) => init());
    notifyListeners();
  }
}
