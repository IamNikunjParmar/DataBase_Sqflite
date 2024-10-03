import 'package:cloud_database_demo/logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class FbAuthHelper {
  FbAuthHelper._();
  static final FbAuthHelper fbAuthHelper = FbAuthHelper._();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final logger = Logger();

  // Email and Password login And Sign up
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

  // Google Authentication
  Future<User?> loginWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

      GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;

      UserCredential userCredential = await firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken,
      ));
      return userCredential.user;
    } catch (e) {
      Log.error(e);
    }
    return null;
  }

  //facebook login
  Future<User?> loginWithFaceBook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString ?? '');

      UserCredential userCredential = await firebaseAuth.signInWithCredential(facebookAuthCredential);
      return userCredential.user;
    } catch (e) {
      Log.error("FireBaseHelper error : $e");
    }
    return null;
  }

  Future<void> logOutUser() async {
    await firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }
}
