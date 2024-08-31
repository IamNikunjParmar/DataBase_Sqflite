import 'package:bloc/bloc.dart';
import 'package:bloc_database_multi_table/modal/student_modal.dart';
import 'package:bloc_database_multi_table/repo/professor_repo.dart';
import 'package:bloc_database_multi_table/student/student_page_event.dart';
import 'package:bloc_database_multi_table/student/student_page_state.dart';

class StudentPageBloc extends Bloc<StudentEvent, StudentState> {
  final ProfessorRepo professorRepo = ProfessorRepo.professorRepo;
  StudentPageBloc() : super(const StudentState()) {
    on<AddTOStudent>(addStudent);
    on<GetToStudent>(getStudent);
    on<DeleteToStudent>(deleteStudent);
    on<UpdateTOStudent>(updateStudent);
    on<GetStudentByProfessor>(_getStudentByProfessor);
    on<SearchForStudent>(_onSearchStudent);
  }

  // Add Student
  Future<void> addStudent(AddTOStudent event, Emitter<StudentState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await professorRepo.insertStudent(event.student);
      emit(state.copyWith(studentList: state.studentList, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "failed to Student"));
    }
  }

  //Get Student
  Future<void> getStudent(GetToStudent event, Emitter<StudentState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final stud = await professorRepo.getAllStudent();
      emit(state.copyWith(studentList: stud, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Failed to Get Student'));
    }
  }

  //Delete Student
  Future<void> deleteStudent(DeleteToStudent event, Emitter<StudentState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await professorRepo.deleteStudent(event.id);
      final deleteStudent = await professorRepo.getAllStudent();
      emit(state.copyWith(studentList: deleteStudent, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "student Delete"));
    }
  }

  //Update Student
  Future<void> updateStudent(UpdateTOStudent event, Emitter<StudentState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await professorRepo.updateStudent(event.upStudent);
      final newUpdate = await professorRepo.getAllStudent();
      emit(state.copyWith(studentList: newUpdate, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Update failed'));
    }
  }

  //GetStudent by Professor
  Future<void> _getStudentByProfessor(GetStudentByProfessor event, Emitter<StudentState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final newProfessor = await professorRepo.getStudentByProfessor(event.profId);
      final professor = await professorRepo.getAllProfessor();
      add(GetToStudent());
      emit(state.copyWith(studentList: newProfessor, isLoading: false, professorList: professor));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'failed for Get student'));
    }
  }

  void _onSearchStudent(SearchForStudent event, Emitter<StudentState> emit) {
    final searchResults = state.studentList
        .where((student) =>
            student.name.toLowerCase().startsWith(event.searchQuery.toLowerCase()) ||
            student.email.toLowerCase().startsWith(event.searchQuery.toLowerCase()) ||
            student.number.startsWith(event.searchQuery))
        .toList();

    emit(state.copyWith(searchList: searchResults));
  }
}
