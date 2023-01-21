import 'package:cloud_firestore/cloud_firestore.dart';

class NewPlanModel {
  NewPlanModel({
    this.userID,
    this.taskID,
    this.taskTitle,
    this.taskDescription,
    this.taskDate,
    this.createdAt,
  });

  String? userID;
  String? taskID;
  String? taskTitle;
  String? taskDescription;
  String? taskDate;
  Timestamp? createdAt;

  factory NewPlanModel.fromJson({Map<String, dynamic>? json, String? taskID}) => NewPlanModel(
        userID: json!['userID'] as String?,
        taskID: taskID,
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
