import 'dart:async';

import 'package:bloc/bloc.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<IncrementCounter>(increment);
    on<DecrementCounter>(decrement);
  }

  FutureOr<void> increment(IncrementCounter event, Emitter<HomeState> emit) {
    emit(state.copyWith(count: state.count + 1));
  }

  FutureOr<void> decrement(DecrementCounter event, Emitter<HomeState> emit) {
    emit(state.copyWith(count: state.count - 1));
  }
}
