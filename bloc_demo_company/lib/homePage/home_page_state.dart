import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int count;

  const HomeState({this.count = 0});

  HomeState copyWith({int? count}) {
    return HomeState(count: count ?? this.count);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [count];
}
