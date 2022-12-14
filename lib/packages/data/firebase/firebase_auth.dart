import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class FirebaseAuthentication {
  Future<UserCredential?> signUp({
    required BuildContext context,
    required String email,
    required String password,
  });
}

class FirebaseAuthImpl implements FirebaseAuthentication {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthImpl({required this.firebaseAuth});

  @override
  Future<UserCredential?> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        context.go('/home');
      }
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
}
