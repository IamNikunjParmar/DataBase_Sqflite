import 'dart:async';

import 'package:bloc_demo/home_page/home_page_event.dart';
import 'package:bloc_demo/home_page/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent,HomePageState>{
  HomePageBloc(super.initialState){
    on<ChangeName>(_changeName);
  }


  FutureOr<void> _changeName(ChangeName event, Emitter<HomePageState> emit) {
    var name = event.name;
    emit(state.copyWith(name: name));
  }
}