import 'package:bloc_database_multi_table/modal/professor_modal.dart';
import 'package:equatable/equatable.dart';

class ProfessorEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddProfessor extends ProfessorEvent {
  final ProfessorModal query;

  AddProfessor({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}

class GetProfessor extends ProfessorEvent {}

class FilterStudentByProfessor extends ProfessorEvent {
  final String student;

  FilterStudentByProfessor({required this.student});

  @override
  // TODO: implement props
  List<Object?> get props => [student];
}

class SearchForProfessor extends ProfessorEvent {
  final String searchQuery;

  SearchForProfessor({required this.searchQuery});
  @override
  // TODO: implement props
  List<Object?> get props => [searchQuery];
}
