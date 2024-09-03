import 'package:cubit_database_sqflite/modal/student_modal.dart';
import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  final List<StudentModal> studentList;
  final bool isLoading;
  final String error;

  const HomePageState({
    this.studentList = const <StudentModal>[],
    this.isLoading = true,
    this.error = '',
  });

  HomePageState copyWith({List<StudentModal>? studentList, String? error, bool? isLoading}) {
    return HomePageState(
      studentList: studentList ?? this.studentList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [studentList, isLoading, error];
}
