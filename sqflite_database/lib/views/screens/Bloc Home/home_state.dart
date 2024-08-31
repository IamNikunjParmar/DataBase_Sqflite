import 'package:equatable/equatable.dart';
import 'package:sqflite_database/model/emp_model.dart';

class HomeState extends Equatable {
  final List<EmployeeModel> employeeList;

  const HomeState({this.employeeList = const <EmployeeModel>[]});

  HomeState copyWith({List<EmployeeModel>? emp}) {
    return HomeState(employeeList: emp ?? employeeList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [employeeList];
}
