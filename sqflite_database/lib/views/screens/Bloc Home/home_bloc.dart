import 'package:bloc/bloc.dart';
import 'package:sqflite_database/helper/db_helper.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DbHelper dbHelper = DbHelper.dbHelper;

  HomeBloc() : super(const HomeState()) {
    on<FatchEmployee>(fatchEmp);
  }

  Future<void> fatchEmp(FatchEmployee event, Emitter<HomeState> emit) async {
    try {
      await dbHelper.initDb();
      await dbHelper.getData();
      emit(state.copyWith(emp: state.employeeList));
    } catch (e) {
      print("$e");
    }
  }
}
