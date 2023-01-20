import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/core/core.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

abstract class UserRepo {
  Future<Either<Failure, UserModel>> createNewUser({
    required UserModel user,
  });
  Future<Either<Failure, UserModel>> updateUser({
    required BuildContext context,
    required UserModel user,
  });
  Future<Either<Failure, UserModel>> getUser({
    required String userID,
  });
  Future<Either<Failure, UserModel>> deleteUser({
    required String userID,
  });
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser(String userID);
}

class UserRepoImpl implements UserRepo {
  final FireStore firestore;

  UserRepoImpl({required this.firestore});
  @override
  Future<Either<Failure, UserModel>> createNewUser({
    required UserModel user,
  }) async {
    try {
      final isUser = await firestore.createNewUser(user: user);
      if (isUser) {
        final userEntity = await firestore.getUser(
          userID: user.userID!,
        );
        return Right(userEntity);
      } else {
        return Left(ServerFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUser({
    required BuildContext context,
    required UserModel user,
  }) async {
    try {
      final isUser = await firestore.updateUser(context: context, user: user);
      if (isUser) {
        final userEntity = await firestore.getUser(
          userID: user.userID!,
        );
        return Right(userEntity);
      } else {
        return Left(ServerFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> deleteUser({required String userID}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> getUser({required String userID}) async {
    try {
      final userModel = await firestore.getUser(
        userID: userID,
      );

      return Right(userModel);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser(String userID) {
    return firestore.getStreamUser(userID);
  }
}
