import 'package:cubit_demo/modal/api_modal.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String error;
  final List<DioModal> userList;

  const HomeState({
    this.isLoading = true,
    this.userList = const <DioModal>[],
    this.error = '',
  });

  HomeState copyWith({
    bool? isLoading,
    List<DioModal>? userList,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      userList: userList ?? this.userList,
      error: error ?? this.error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, error, userList];
}
