import 'package:bloc_database_multi_table/modal/professor_modal.dart';
import 'package:bloc_database_multi_table/modal/student_modal.dart';
import 'package:equatable/equatable.dart';

class StudentState extends Equatable {
  final List<StudentModal> studentList;
  final bool isLoading;
  final String error;
  final List<ProfessorModal> professorList;

  const StudentState({
    this.studentList = const <StudentModal>[],
    this.isLoading = true,
    this.error = '',
    this.professorList = const <ProfessorModal>[],
  });

  StudentState copyWith(
      {List<StudentModal>? studentList, bool? isLoading, String? error, List<ProfessorModal>? professorList}) {
    return StudentState(
      studentList: studentList ?? this.studentList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      professorList: professorList ?? this.professorList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [studentList, isLoading, error,professorList];
}
