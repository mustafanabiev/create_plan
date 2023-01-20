import 'dart:developer';

import 'package:create_plan/packages/packages.dart';

abstract class NewPlanRepo {
  Future<NewPlanModel> createNewPlan({
    required NewPlanModel newPlan,
  });
  //   Future<Either<Failure, UserModel>> deleteUser({
  //   required String userID,
  // });
  //   Future<Either<Failure, UserModel>> updateUser({
  //   required BuildContext context,
  //   required UserModel user,
  // });
  // Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser();

}

class NewPlanRepoImpl implements NewPlanRepo {
  final FireStore firestore;

  NewPlanRepoImpl({required this.firestore});

  @override
  Future<NewPlanModel> createNewPlan({
    required NewPlanModel newPlan,
  }) async {
    try {
      return await firestore.createNewPlan(newplan: newPlan);
    } catch (e) {
      log(e.toString());
    }
    return newPlan;
  }
}
