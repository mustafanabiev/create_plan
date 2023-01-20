import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskCreatedAt extends StatelessWidget {
  const TaskCreatedAt({required this.createdAt, super.key});
  final Timestamp createdAt;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${createdAt.toDate().hour}:${createdAt.toDate().minute} / ${createdAt.toDate().day}-${createdAt.toDate().month}-${createdAt.toDate().year}',
    );
  }
}
