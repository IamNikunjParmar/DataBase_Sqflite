import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_database_crud/helper/emp_helper.dart';
import 'package:hive_database_crud/modal/employee_modal.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageInitial());
  final EmpHelper empHelper = EmpHelper.empHelper;

  static const String empBoxName = 'empBox';

  Future<void> onInsertEmp(EmployeeModal emp) async {
    try {
      emit(const HomePageLoading());
      await empHelper.insertEmp(emp);
      final currentState = state;
      if (currentState is HomePageLoaded) {
        final newList = List<EmployeeModal>.from(currentState.empList);
        emit(HomePageLoaded(empList: newList));
      }
    } catch (e) {
      emit(HomePageError(msg: e.toString()));
    }
  }

  Future<void> onGetEmp() async {
    try {
      emit(const HomePageLoading());
      final newList = await empHelper.getEmp();
      emit(HomePageLoaded(empList: newList));
    } catch (e) {
      emit(HomePageError(msg: e.toString()));
    }
  }
}
