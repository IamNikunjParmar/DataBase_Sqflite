import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchApi extends ApiEvent {}
