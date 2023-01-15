import 'package:cloud_firestore/cloud_firestore.dart';

UserModel authFromJson(Map docMap) => UserModel.fromJson(docMap as Map<String, dynamic>);

class UserModel {
  UserModel({
    this.userID,
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.userProFileImage,
    this.accessToken,
    this.refreshToken,
    this.title,
    this.note,
    this.date,
    this.createdAt,
  });

  String? userID;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? userProFileImage;
  String? accessToken;
  String? refreshToken;
  //!
  String? title;
  String? note;
  String? date;
  Timestamp? createdAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userID: json['userID'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        password: json['password'] as String?,
        userProFileImage: json['userProFileImage'] as String?,
        accessToken: json['accessToken'] as String?,
        refreshToken: json['refreshToken'] as String?,
        //!
        title: json['title'] as String?,
        note: json['note'] as String?,
        date: json['date'] as String?,
        createdAt: json['createdAt'] as Timestamp?,
      );

  factory UserModel.fromCacheJson(Map<String, dynamic> json) => UserModel(
        userID: json['userID'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        password: json['password'] as String?,
        userProFileImage: json['userProFileImage'] as String?,
        accessToken: json['accessToken'] as String?,
        refreshToken: json['refreshToken'] as String?,
        //!
        title: json['title'] as String?,
        note: json['note'] as String?,
        date: json['date'] as String?,
        createdAt: json['createdAt'] as Timestamp?,
      );

  Map<String, dynamic> toJson() => {
        "userID": userID ?? '',
        "name": name ?? '',
        "email": email ?? '',
        "phoneNumber": phoneNumber ?? '',
        "password": password ?? '',
        "userProFileImage": userProFileImage ?? '',
        "accessToken": accessToken ?? '',
        "refreshToken": refreshToken ?? '',
        //!
        "title": title ?? '',
        "note": note ?? '',
        "date": date ?? '',
        "createdAt": createdAt ?? Timestamp.now(),
      };

  Map<String, dynamic> toCacheJson() => {
        "userID": userID ?? '',
        "name": name ?? '',
        "email": email ?? '',
        "phoneNumber": phoneNumber ?? '',
        "password": password ?? '',
        "userProFileImage": userProFileImage ?? '',
        "accessToken": accessToken ?? '',
        "refreshToken": refreshToken ?? '',
        //!
        "title": title ?? '',
        "note": note ?? '',
        "date": date ?? '',
        "createdAt": createdAt ?? Timestamp.now(),
      };
}
