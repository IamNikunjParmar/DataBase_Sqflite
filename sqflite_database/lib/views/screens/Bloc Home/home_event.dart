import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FatchEmployee extends HomeEvent {
  final String query;

  FatchEmployee({required this.query});
}
