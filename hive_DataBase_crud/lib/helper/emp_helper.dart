import 'package:hive/hive.dart';
import 'package:hive_database_crud/modal/employee_modal.dart';

class EmpHelper {
  EmpHelper._();

  static final EmpHelper empHelper = EmpHelper._();
  static const String empBoxName = 'empBox';

  Future<void> insertEmp(EmployeeModal emp) async {
    final box = Hive.box<EmployeeModal>(empBoxName);
    await box.add(emp);
    print("emp :$emp");
  }

  Future<List<EmployeeModal>> getEmp() async {
    final box = Hive.box<EmployeeModal>(empBoxName);
    return box.values.toList();
  }
}
