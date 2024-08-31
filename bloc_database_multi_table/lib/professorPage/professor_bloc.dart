import 'package:bloc/bloc.dart';
import 'package:bloc_database_multi_table/modal/professor_modal.dart';
import 'package:bloc_database_multi_table/professorPage/professor_event.dart';
import 'package:bloc_database_multi_table/professorPage/professor_state.dart';
import 'package:bloc_database_multi_table/repo/professor_repo.dart';

class ProfessorBloc extends Bloc<ProfessorEvent, ProfessorState> {
  final ProfessorRepo professorRepo = ProfessorRepo.professorRepo;

  ProfessorBloc() : super(const ProfessorState()) {
    on<AddProfessor>(addToProfessor);
    on<GetProfessor>(getToProfessor);
    on<FilterStudentByProfessor>(_filterStudentByProfessor);
    on<SearchForProfessor>(_onSearchProfessor);
  }

  //Insert professor
  Future<void> addToProfessor(AddProfessor event, Emitter<ProfessorState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await professorRepo.insertProfessor(event.query);
      emit(state.copyWith(professorList: state.professorList, isLoading: false, refresh: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "failed to insert professor"));
    }
  }

  //get professor
  Future<void> getToProfessor(GetProfessor event, Emitter<ProfessorState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final prof = await professorRepo.getAllProfessor();
      emit(state.copyWith(professorList: prof, isLoading: false, refresh: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Failed to no Professor"));
    }
  }

  Future<void> _filterStudentByProfessor(FilterStudentByProfessor event, Emitter<ProfessorState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final newProfessor = await professorRepo.getStudentByProfessor(event.student);
      emit(state.copyWith(filterStudentList: newProfessor, isLoading: false, professorList: state.professorList));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  // Search For Professor
  void _onSearchProfessor(SearchForProfessor event, Emitter<ProfessorState> emit) {
    final searchResults = state.professorList
        .where((professor) =>
            professor.name.toLowerCase().startsWith(event.searchQuery.toLowerCase()) ||
            professor.subject.toLowerCase().startsWith(event.searchQuery.toLowerCase()) ||
            professor.number.startsWith(event.searchQuery))
        .toList();

    emit(state.copyWith(searchList: searchResults));
  }
}
