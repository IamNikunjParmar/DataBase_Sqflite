import 'package:bloc_demo_company/DetailsPage/details_Page_view.dart';
import 'package:equatable/equatable.dart';

class DetailsState extends Equatable {
  final List<AllFood> filterFood;
  final String newFood;

  const DetailsState({
    this.filterFood = const <AllFood>[],
    this.newFood = '',
  });

  DetailsState copyWith({List<AllFood>? filterFood, String? newFood}) {
    return DetailsState(
      filterFood: filterFood ?? this.filterFood,
      newFood: newFood ?? this.newFood,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [filterFood, newFood];
}
