import 'package:bloc/bloc.dart';
import 'package:cubit_database_sqflite/helper/db_helper.dart';
import 'package:cubit_database_sqflite/modal/student_modal.dart';
import 'package:meta/meta.dart';

import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final DbHelper dbHelper = DbHelper.dbHelper;
  HomePageCubit() : super(const HomePageState());

  // insert Student
  Future<void> onInsertStudent(StudentModal student) async {
    emit(state.copyWith(isLoading: true));
    try {
      await dbHelper.insertStudent(student);
      emit(state.copyWith(studentList: state.studentList, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  // get All Student
  Future<void> onGetStudent() async {
    emit(state.copyWith(isLoading: true));
    try {
      final List<StudentModal> newList = await dbHelper.getAllStudent();
      emit(state.copyWith(studentList: newList, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  //Update Student
  Future<void> onUpdateStudent(StudentModal student) async {
    emit(state.copyWith(isLoading: true));
    try {
      await dbHelper.updateStudent(student);
      final updateStudent = await dbHelper.getAllStudent();
      emit(state.copyWith(studentList: updateStudent, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  //Delete Student
  Future<void> onDeleteStudent(int id) async {
    emit(state.copyWith(isLoading: true));
    try {
      await dbHelper.deleteStudent(id);
      emit(state.copyWith(studentList: state.studentList, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
