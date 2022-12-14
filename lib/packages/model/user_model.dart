UserModel authFromJson(Map docMap) =>
    UserModel.fromJson(docMap as Map<String, dynamic>);

class UserModel {
  String? userID;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? userProFileImage;
  String? accessToken;
  String? refreshToken;
  UserModel({
    this.userID,
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.userProFileImage,
    this.accessToken,
    this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userID: json['userID'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        password: json['password'] as String?,
        userProFileImage: json['userProFileImage'] as String?,
        accessToken: json['accessToken'] as String?,
        refreshToken: json['refreshToken'] as String?,
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
      };
}
