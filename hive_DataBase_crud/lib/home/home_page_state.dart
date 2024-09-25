part of 'home_page_cubit.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomePageInitial extends HomePageState {
  const HomePageInitial();
}

class HomePageLoading extends HomePageState {
  const HomePageLoading();
}

class HomePageLoaded extends HomePageState {
  final List<EmployeeModal> empList;
  const HomePageLoaded({required this.empList});

  @override
  // TODO: implement props
  List<Object?> get props => [empList];
}

class HomePageError extends HomePageState {
  final String msg;

  const HomePageError({required this.msg});

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
