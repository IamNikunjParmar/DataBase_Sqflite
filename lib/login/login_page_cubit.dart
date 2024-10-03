import 'package:bloc/bloc.dart';
import 'package:cloud_database_demo/home/home_page_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:toastification/toastification.dart';

import '../helper/fb_auth_helper.dart';
import '../logger/logger.dart';
import '../main.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit(this.context) : super(const LoginPageState());

  final logger = Logger();
  final BuildContext context;
  bool password = false;
// Email And Password Login
  Future<void> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      final result = await FbAuthHelper.fbAuthHelper.loginEmailAndPassword(
        email: email,
        password: password,
      );
      if (result!.contains('success')) {
        Log.success("success");
        toastification.show(
          autoCloseDuration: const Duration(
            seconds: 3,
          ),
          title: Text(
            result,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
          icon: const Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 35,
          ),
        );
        Navigator.pushNamedAndRemoveUntil(context, HomePageView.routeName, (route) => false, arguments: user);
      } else {
        emit(state.copyWith(error: result));
        toastification.show(
          autoCloseDuration: const Duration(
            seconds: 3,
          ),
          title: Text(
            result ?? "unknown Error occurred",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
          icon: const Icon(
            Icons.cancel_outlined,
            color: Colors.white,
            size: 35,
          ),
        );
      }
    } catch (e) {
      logger.e(" Login Cubit Error :: $e");
      emit(state.copyWith(error: e.toString()));
    }
  }

  //Google Login

  Future<void> googleWithLogin() async {
    try {
      final user = await FbAuthHelper.fbAuthHelper.loginWithGoogle();
      if (user != null) {
        toastification.show(
          autoCloseDuration: const Duration(
            seconds: 3,
          ),
          title: const Text(
            "Login Success",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
          icon: const Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 35,
          ),
        );
        if (context.mounted) {
          Navigator.of(context).pushNamed(HomePageView.routeName);
        }
      } else {
        toastification.show(
          autoCloseDuration: const Duration(
            seconds: 3,
          ),
          title: const Text(
            'Login Failed',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
          icon: const Icon(
            Icons.cancel_outlined,
            color: Colors.white,
            size: 35,
          ),
        );
      }
    } catch (e) {
      Log.error(e);
      toastification.show(
        autoCloseDuration: const Duration(seconds: 3),
        title: Text(
          'Error: ${e.toString()}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        icon: const Icon(
          Icons.cancel_outlined,
          color: Colors.white,
          size: 35,
        ),
      );
    }
  }

  Future<void> facebookLogin() async {
    try {
      await FbAuthHelper.fbAuthHelper.loginWithFaceBook();
    } catch (e) {
      Log.error(e);
      toastification.show(
        autoCloseDuration: const Duration(seconds: 3),
        title: Text(
          'Error: ${e.toString()}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        icon: const Icon(
          Icons.cancel_outlined,
          color: Colors.white,
          size: 35,
        ),
      );
    }
  }
}
