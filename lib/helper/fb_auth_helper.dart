import 'package:cloud_database_demo/logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class FbAuthHelper {
  FbAuthHelper._();
  static final FbAuthHelper fbAuthHelper = FbAuthHelper._();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final logger = Logger();

  Future<String?> registrationEmailAndPassword({required String email, required String password}) async {
    try {
      final userCre = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCre.user;
      if (user != null) {
        await user.sendEmailVerification();
      }
      return 'Register success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        return 'password is too weak please  enter Your Strong Password ';
      } else if (e.code == 'email-already-use') {
        return ' The Account is the Already exists ';
      } else {
        Log.error("FirebaseException Error : $e");
        return e.message;
      }
    } catch (e) {
      Log.error(e);
      return e.toString();
    }
  }

  Future<String?> loginEmailAndPassword({required String email, required String password}) async {
    if (email.isEmpty) {
      return 'please enter email';
    } else if (password.isEmpty) {
      return 'please enter password';
    } else if (email.isNotEmpty || password.isNotEmpty) {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        return 'Login success';
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user not found') {
          return 'No user found for that email. ';
        } else if (e.code == 'wrong - password') {
          return ' Wrong password provide that user.';
        } else {
          Log.error("FireBase Login Error :$e");
          return e.message;
        }
      } catch (e) {
        logger.e("Error :::::: $e");
        return e.toString();
      }
    }

    return "not found";
  }

  Future<void> logOutUser() async {
    await firebaseAuth.signOut();
  }
}
