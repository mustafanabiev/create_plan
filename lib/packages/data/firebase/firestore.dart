import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:flutter/material.dart';

abstract class FireStore {
  Future<bool> createNewUser({required UserModel user});
  Future<UserModel> getUser({required String userID});
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser();
  Future<bool> updateUser({
    required BuildContext context,
    required UserModel user,
  });
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
  Future<bool> updateUser({
    required BuildContext context,
    required UserModel user,
  }) async {
    final updates = <String, dynamic>{
      "tasktitle": user.taskTitle ?? '',
      "taskDescription": user.taskDescription ?? '',
      "taskDate": user.taskDate ?? '',
    };
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
  Future<UserModel> getUser({required String userID}) async {
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
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser() {
    final data = firestoreDB.collection('users').snapshots();

    return data;
  }
}
