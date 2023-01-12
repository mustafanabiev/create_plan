import 'package:create_plan/app/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseAuthentication {
  Future<UserCredential?> signIn({
    required String email,
    required String password,
    required BuildContext context,
  });
  Future<UserCredential?> signUp({
    required BuildContext context,
    required String email,
    required String password,
  });
  Future<UserCredential?> signInWithGoogle({
    required BuildContext context,
  });
  Future<UserCredential?> signOut({
    required BuildContext context,
  });
}

class FirebaseAuthImpl implements FirebaseAuthentication {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthImpl({required this.firebaseAuth});

  @override
  Future<UserCredential?> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // // ignore: unnecessary_null_comparison
      // if (user != null) {
      //   // ignore: use_build_context_synchronously
      //   context.read<TokenCubit>().save(user.user!.uid);
      // } else {
      //   debugPrint('Error');
      // }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      return throw Exception(e.toString());
    }
    return null;
  }

  @override
  Future<UserCredential?> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      return throw Exception(e.toString());
    }
    return null;
  }

  @override
  Future<UserCredential?> signInWithGoogle({
    required BuildContext context,
  }) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserCredential?> signOut({
    required BuildContext context,
  }) async {
    try {
      context.read<TokenCubit>().clear();
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }
}
