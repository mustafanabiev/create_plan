import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/packages/packages.dart';

abstract class NewPlanRepo {
  Future<NewPlanModel> createNewPlan({
    required NewPlanModel newPlan,
  });
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser(String userID);
  Future<NewPlanModel> updateNewPlan({required NewPlanModel newPlanModel});
  //   Future<Either<Failure, UserModel>> deleteUser({
  //   required String userID,
  // });
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

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser(String userID) {
    return firestore.getStreamUser(userID);
  }

  @override
  Future<NewPlanModel> updateNewPlan({
    required NewPlanModel newPlanModel,
  }) async {
    return await firestore.updateNewPlan(newPlanModel: newPlanModel);
  }
}
