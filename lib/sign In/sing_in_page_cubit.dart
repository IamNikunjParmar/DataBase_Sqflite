import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:cloud_database_demo/helper/fb_auth_helper.dart';
import 'package:cloud_database_demo/home/home_page_view.dart';
import 'package:cloud_database_demo/logger/logger.dart';
import 'package:cloud_database_demo/login/login_page_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:toastification/toastification.dart';

part 'sing_in_page_state.dart';

class SingInPageCubit extends Cubit<SingInPageState> {
  SingInPageCubit(this.context) : super(const SingInPageState());
  final logger = Logger();

  final BuildContext context;
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final result = await FbAuthHelper.fbAuthHelper.registrationEmailAndPassword(
        email: email,
        password: password,
      );

      if (result!.contains('success')) {
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
        if (context.mounted) {
          Navigator.pushNamed(context, LoginPageView.routeName);
        }
      } else {
        emit(state.copyWith(error: result));
        toastification.show(
          autoCloseDuration: const Duration(
            seconds: 3,
          ),
          title: Text(
            result ?? '',
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
      logger.e(" Sign in Cubit Error :: $e");
      emit(state.copyWith(error: e.toString()));
    }
  }
}
