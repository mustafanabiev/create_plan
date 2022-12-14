import 'package:create_plan/core/error/exception.dart';
import 'package:create_plan/core/error/failure.dart';
import 'package:create_plan/packages/model/user_model.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either<Failure, UserModel>> createNewUser({
    required UserModel user,
  });

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
}
