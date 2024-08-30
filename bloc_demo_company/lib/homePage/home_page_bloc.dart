import 'package:bloc/bloc.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    void increment(IncrementCounter event, Emitter<HomeState> emit) {
      emit(state.copyWith(count: state.count + 1));
    }

    void decrement(DecrementCounter event, Emitter<HomeState> emit) {
      emit(state.copyWith(count: state.count - 1));
    }

    on<IncrementCounter>(increment);
    on<DecrementCounter>(decrement);
  }
}
