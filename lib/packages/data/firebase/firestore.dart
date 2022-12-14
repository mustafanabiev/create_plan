import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/packages/model/user_model.dart';

abstract class FireStore {
  Future<bool> createNewUser({required UserModel user});
  Future<UserModel> getUser({required String userID});
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
  Future<UserModel> getUser({required String userID}) async {
    DocumentSnapshot user =
        await firestoreDB.collection("users").doc(userID).get();
    if (user.exists) {
      final userMap = user.data() as Map<String, dynamic>;
      UserModel userObject = UserModel.fromJson(userMap);
      return userObject;
    } else {
      return UserModel();
    }
  }
}
