import 'package:bloc/bloc.dart';
import 'package:bloc_demo_company/DetailsPage/details_Page_view.dart';

import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  static final List<AllFood> foods = [
    AllFood(name: "mango", price: 55),
    AllFood(name: "banana", price: 40),
    AllFood(name: "aiwi", price: 155),
    AllFood(name: "apple", price: 200),
    AllFood(name: "water", price: 100),
  ];

  DetailsBloc() : super(DetailsState(filterFood: foods)) {
    on<SearchFood>(_filterFood);
  }

  void _filterFood(SearchFood event, Emitter<DetailsState> emit) {
    if (event.query.isEmpty) {
      emit(state.copyWith(filterFood: foods));
    } else {
      var filterList =
          state.filterFood.where((foods) => foods.name.toLowerCase().startsWith(event.query.toLowerCase())).toList();

      emit(state.copyWith(filterFood: filterList));
    }
  }
}
