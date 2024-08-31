import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_multi_table/helper/db_helper.dart';
import 'package:sqflite_multi_table/modal/db_modal.dart';
import '../modal/comp_modal.dart';

class DbController extends ChangeNotifier {
  List<EmpModal> allData1 = [];
  List<CmpModal> allData2 = [];
  List<Map<String, dynamic>> joinedData = [];

  DbController() {
    initDb();
  }

  Future<void> initDb() async {
    await DbHelper.dbHelper.initDb();
    await fetchData1();
    await fetchData2();
  }

  // First Table Methods
  Future<void> fetchData1() async {
    allData1 = await DbHelper.dbHelper.getData1();
    notifyListeners();
  }

  Future<void> addData1({required EmpModal empModal}) async {
    await DbHelper.dbHelper.insertData1(empModal: empModal);
    await fetchData1();
  }

  // Second Table Methods
  Future<void> fetchData2() async {
    allData2 = await DbHelper.dbHelper.getData2();
    notifyListeners();
  }

  Future<void> addData2({required CmpModal cmpModal}) async {
    await DbHelper.dbHelper.insertData2(cmpModal: cmpModal);
    await fetchData2();
  }

  // Joined Data Method
  Future<void> fetchJoinedData() async {
    joinedData = await DbHelper.dbHelper.getJoinedData();
    notifyListeners();
  }
}
