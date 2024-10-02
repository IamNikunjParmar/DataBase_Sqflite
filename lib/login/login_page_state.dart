part of 'login_page_cubit.dart';

class LoginPageState extends Equatable {
  final String error;
  final bool password;

  const LoginPageState({this.error = '', this.password = true});

  LoginPageState copyWith({String? error, bool? password}) {
    return LoginPageState(
      error: error ?? this.error,
      password: password ?? this.password,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [error, password];
}
