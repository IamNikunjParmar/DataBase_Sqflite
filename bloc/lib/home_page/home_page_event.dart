import 'package:equatable/equatable.dart';

class HomePageEvent extends Equatable{
  @override
  List<Object?> get props =>[];
}

class ChangeName extends HomePageEvent{
  final String name;

  ChangeName({
    required this.name,
  });
}