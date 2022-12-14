import 'package:create_plan/core/error/exception.dart';
import 'package:create_plan/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../packages.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserCredential?>> signUp({
    required BuildContext context,
    required String email,
    required String password,
  });
}

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthentication firebaseAuth;

  AuthRepoImpl({required this.firebaseAuth});

  @override
  Future<Either<Failure, UserCredential?>> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      return Right(await firebaseAuth.signUp(
        context: context,
        email: email,
        password: password,
      ));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
