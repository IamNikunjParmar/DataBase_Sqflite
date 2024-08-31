import 'package:equatable/equatable.dart';

class DetailsEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchFood extends DetailsEvent {
  final String query;

  SearchFood({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}
