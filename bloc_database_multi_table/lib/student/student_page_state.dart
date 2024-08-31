import 'package:bloc_database_multi_table/modal/professor_modal.dart';
import 'package:bloc_database_multi_table/modal/student_modal.dart';
import 'package:equatable/equatable.dart';

class StudentState extends Equatable {
  final List<StudentModal> studentList;
  final bool isLoading;
  final String error;
  final List<ProfessorModal> professorList;
  final List<StudentModal> searchList;

  const StudentState({
    this.studentList = const <StudentModal>[],
    this.isLoading = true,
    this.error = '',
    this.professorList = const <ProfessorModal>[],
    this.searchList = const <StudentModal>[],
  });

  StudentState copyWith(
      {List<StudentModal>? studentList,
      bool? isLoading,
      String? error,
      List<ProfessorModal>? professorList,
      List<StudentModal>? searchList}) {
    return StudentState(
      studentList: studentList ?? this.studentList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      professorList: professorList ?? this.professorList,
      searchList: searchList ?? this.searchList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [studentList, isLoading, error, professorList, searchList];
}
