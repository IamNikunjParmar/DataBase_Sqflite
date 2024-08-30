import 'package:bloc_database_multi_table/modal/student_modal.dart';
import 'package:equatable/equatable.dart';

class StudentEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddTOStudent extends StudentEvent {
  final StudentModal student;

  AddTOStudent({required this.student});

  @override
  // TODO: implement props
  List<Object?> get props => [student];
}

class GetToStudent extends StudentEvent {}

class DeleteToStudent extends StudentEvent {
  final int id;

  DeleteToStudent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class UpdateTOStudent extends StudentEvent {
  final StudentModal upStudent;

  UpdateTOStudent({required this.upStudent});
  @override
  // TODO: implement props
  List<Object?> get props => [upStudent];
}

class GetStudentByProfessor extends StudentEvent {
  final String profId;

  GetStudentByProfessor({required this.profId});
  @override
  // TODO: implement props
  List<Object?> get props => [profId];
}
