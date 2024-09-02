import 'package:equatable/equatable.dart';

enum ApiStatus { loading, success, error }

class HomeState extends Equatable {
  final ApiStatus apiStatus;

  const HomeState({this.apiStatus = ApiStatus.loading});

  HomeState copyWith({ApiStatus? apiStatus}) {
    return HomeState(apiStatus: apiStatus ?? this.apiStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [ApiStatus];
}
