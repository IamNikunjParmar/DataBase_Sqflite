import 'package:bloc/bloc.dart';
import 'package:cubit_database_sqflite/helper/db_helper.dart';
import 'package:cubit_database_sqflite/modal/student_modal.dart';
import 'package:meta/meta.dart';

import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final DbHelper dbHelper = DbHelper.dbHelper;
  HomePageCubit() : super(const HomePageState());

  Future<void> onInsertStudent(StudentModal student) async {
    emit(state.copyWith(isLoading: true));
    try {
      await dbHelper.insertStudent(student);
      emit(state.copyWith(studentList: state.studentList, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> onGetStudent() async {
    emit(state.copyWith(isLoading: true));
    try {
      final newList = await dbHelper.getAllStudent();
      emit(state.copyWith(studentList: newList, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
