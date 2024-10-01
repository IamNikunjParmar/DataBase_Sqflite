part of 'login_page_cubit.dart';

class LoginPageState extends Equatable {
  final String error;

  const LoginPageState({this.error = ''});

  LoginPageState copyWith({String? error}) {
    return LoginPageState(error: error ?? this.error);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
