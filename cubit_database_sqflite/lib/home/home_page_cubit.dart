import 'package:bloc/bloc.dart';
import 'package:cubit_database_sqflite/helper/db_helper.dart';
import 'package:cubit_database_sqflite/modal/student_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final DbHelper dbHelper = DbHelper.dbHelper;

  HomePageCubit() : super(const HomePageState());

  // insert Student
  Future<void> onInsertStudent(StudentModal student) async {
    emit(state.copyWith(isLoading: true));
    try {
      await dbHelper.insertStudent(student);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  // get All Student
  Future<void> onGetStudent() async {
    emit(state.copyWith(isLoading: true));
    try {
      final newList = await dbHelper.getAllStudent();
      emit(state.copyWith(studentList: newList, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  //Update Student
  Future<void> onUpdateStudent(StudentModal student) async {
    // emit(state.copyWith(isLoading: true));
    try {
      await dbHelper.updateStudent(student);
      var list = List<StudentModal>.from(state.studentList);
      var index = list.indexWhere((element) => element.id == student.id);
      print("GetUpdateIndex: $index");
      if (index != -1) {
        list[index] = student;
      }
      print("GetUpdateData213: ${list[index].toJson()}");
      emit(state.copyWith(studentList: list));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  //Delete Student
  Future<void> onDeleteStudent(int id) async {
    // emit(state.copyWith(isLoading: true));
    try {
      await dbHelper.deleteStudent(id);
      var list = List<StudentModal>.from(state.studentList);
      print("GetListLength: ${state.studentList.length}");
      list.removeWhere((element) => element.id == id);
      emit(state.copyWith(studentList: list));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void showEditStudentDialog(StudentModal student, BuildContext context) {
    TextEditingController nameController = TextEditingController(text: student.name);
    TextEditingController courseController = TextEditingController(text: student.course);
    TextEditingController numberController = TextEditingController(text: student.number);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Student"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: courseController,
                decoration: const InputDecoration(labelText: 'Course'),
              ),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(labelText: 'Number'),
              ),
            ],
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                student = student.copyWith(
                  name: nameController.text.trim(),
                  course: courseController.text.trim(),
                  number: numberController.text.trim(),
                );
                onUpdateStudent(student);
                Navigator.pop(context, true);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    showCloseIcon: true,
                    behavior: SnackBarBehavior.fixed,
                    backgroundColor: Colors.green,
                    content: Text("Student Updated.."),
                  ),
                );
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
    // if (result == true) {
    //   await context.read<HomePageCubit>().onGetStudent();
    // }
  }
}
