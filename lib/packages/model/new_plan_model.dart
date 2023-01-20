import 'package:cloud_firestore/cloud_firestore.dart';

NewPlanModel authFromJson(Map docMap) => NewPlanModel.fromJson(docMap as Map<String, dynamic>);

class NewPlanModel {
  NewPlanModel({
    this.userID,
    this.taskTitle,
    this.taskDescription,
    this.taskDate,
    this.createdAt,
  });

  String? userID;
  String? taskTitle;
  String? taskDescription;
  String? taskDate;
  Timestamp? createdAt;

  factory NewPlanModel.fromJson(Map<String, dynamic> json) => NewPlanModel(
        userID: json['userID'] as String?,
        taskTitle: json['tasktitle'] as String?,
        taskDescription: json['taskDescription'] as String?,
        taskDate: json['taskDate'] as String?,
        createdAt: json['createdAt'] as Timestamp?,
      );

  factory NewPlanModel.fromCacheJson(Map<String, dynamic> json) => NewPlanModel(
        userID: json['userID'] as String?,
        taskTitle: json['tasktitle'] as String?,
        taskDescription: json['taskDescription'] as String?,
        taskDate: json['taskDate'] as String?,
        createdAt: json['createdAt'] as Timestamp?,
      );

  Map<String, dynamic> toJson() => {
        "userID": userID ?? '',
        "tasktitle": taskTitle ?? '',
        "taskDescription": taskDescription ?? '',
        "taskDate": taskDate ?? '',
        "createdAt": createdAt ?? Timestamp.now(),
      };

  Map<String, dynamic> toCacheJson() => {
        "userID": userID ?? '',
        "tasktitle": taskTitle ?? '',
        "taskDescription": taskDescription ?? '',
        "taskDate": taskDate ?? '',
        "createdAt": createdAt ?? Timestamp.now(),
      };
}
