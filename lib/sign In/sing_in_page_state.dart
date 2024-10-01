part of 'sing_in_page_cubit.dart';

class SingInPageState extends Equatable {
  final String error;

  const SingInPageState({this.error = ''});

  SingInPageState copyWith({String? error}) {
    return SingInPageState(
      error: error ?? this.error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
