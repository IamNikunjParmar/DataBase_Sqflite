import 'package:bloc_database_multi_table/modal/professor_modal.dart';
import 'package:bloc_database_multi_table/modal/student_modal.dart';
import 'package:equatable/equatable.dart';

class ProfessorState extends Equatable {
  final List<ProfessorModal> professorList;
  final bool isLoading;
  final bool refresh;
  final String error;
  final List<StudentModal> filterStudentList;
  final List<ProfessorModal> searchList;

  const ProfessorState({
    this.professorList = const <ProfessorModal>[],
    this.isLoading = true,
    this.error = "",
    this.refresh = false,
    this.filterStudentList = const <StudentModal>[],
    this.searchList = const <ProfessorModal>[],
  });

  ProfessorState copyWith({
    List<ProfessorModal>? professorList,
    bool? isLoading,
    String? error,
    bool? refresh,
    List<StudentModal>? filterStudentList,
    List<ProfessorModal>? searchList,
  }) {
    return ProfessorState(
      professorList: professorList ?? this.professorList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      refresh: refresh ?? this.refresh,
      filterStudentList: filterStudentList ?? this.filterStudentList,
      searchList: searchList ?? this.searchList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [professorList, isLoading, error, refresh, filterStudentList, searchList];
}
