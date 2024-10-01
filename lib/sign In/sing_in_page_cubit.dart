import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:cloud_database_demo/helper/fb_auth_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:toastification/toastification.dart';

part 'sing_in_page_state.dart';

class SingInPageCubit extends Cubit<SingInPageState> {
  SingInPageCubit() : super(const SingInPageState());
  final logger = Logger();

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final result = await FbAuthHelper.fbAuthHelper.registrationEmailAndPassword(
        email: email,
        password: password,
      );

      if (result == 'success') {
        toastification.show(
          autoCloseDuration: const Duration(
            seconds: 3,
          ),
          title: const Text(
            'Account Created....',
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
      logger.e("Cubit Error :: $e");
      emit(state.copyWith(error: e.toString()));
    }
  }
}
