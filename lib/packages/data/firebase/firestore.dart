import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:flutter/material.dart';

abstract class FireStore<T> {
  Future<bool> createNewUser({required UserModel user});
  Future<T> createNewPlan({required NewPlanModel newplan});
  Future<T> getUser({required String userID});
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser(String userID);
  Future<bool> updateUser({
    required BuildContext context,
    required UserModel user,
  });
  Future<T> updateNewPlan({required NewPlanModel newPlanModel});
}

class FireStoreImpl implements FireStore {
  final FirebaseFirestore firestoreDB;

  FireStoreImpl({required this.firestoreDB});

  @override
  Future<bool> createNewUser({required UserModel user}) async {
    return await firestoreDB
        .collection("users")
        .doc(user.userID)
        .get()
        .then((userDoc) {
      final newUser = UserModel(
        userID: user.userID,
        name: user.name,
        email: user.email,
        password: user.password,
        phoneNumber: user.phoneNumber,
        userProFileImage: user.userProFileImage,
      ).toJson();
      if (!userDoc.exists) {
        firestoreDB.collection("users").doc(user.userID).set(
              newUser,
              SetOptions(merge: true),
            );
      }
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  @override
  Future createNewPlan({required NewPlanModel newplan}) async {
    final newPlan = newplan.toJson();

    final newTaskPlan = firestoreDB
        .collection("users")
        .doc(newplan.userID)
        .collection('newPlan')
        .doc()
        .set(
          newPlan,
          SetOptions(merge: true),
        );
    return newTaskPlan;
  }

  @override
  Future<bool> updateUser({
    required BuildContext context,
    required UserModel user,
  }) async {
    final updates = <String, dynamic>{};
    return await firestoreDB
        .collection('users')
        .doc(user.userID)
        .update(updates)
        .then((userDoc) {
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  @override
  Future<bool> updateNewPlan({required NewPlanModel newPlanModel}) async {
    final updates = <String, dynamic>{
      "tasktitle": newPlanModel.taskTitle,
      "taskDescription": newPlanModel.taskDescription,
      "taskDate": newPlanModel.taskDate,
      "createdAt": newPlanModel.createdAt ?? Timestamp.now(),
    };
    return await firestoreDB
        .collection('users')
        .doc(newPlanModel.userID)
        .collection('newPlan')
        .doc(newPlanModel.taskID)
        .update(updates)
        .then((userDoc) {
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  @override
  Future getUser({required String userID}) async {
    DocumentSnapshot user =
        await firestoreDB.collection('users').doc(userID).get();
    if (user.exists) {
      final userMap = user.data() as Map<String, dynamic>;
      UserModel userObject = UserModel.fromJson(userMap);
      return userObject;
    } else {
      return UserModel();
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser(String userID) {
    return firestoreDB
        .collection('users')
        .doc(userID)
        .collection('newPlan')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
