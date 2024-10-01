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
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        return 'password is too weak please  enter Your Strong Password ';
      } else if (e.code == 'email-already-use') {
        return ' The Account is the Already exists ';
      } else {
        logger.e("FirebaseException Error : $e");
        return e.message;
      }
    } catch (e) {
      logger.e("Error :::::: $e");
      return e.toString();
    }
  }

  Future<String?> loginEmailAndPassword({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'success';
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
}
