import 'package:create_plan/components/components.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:flutter/material.dart';

class NewPlanCard extends StatelessWidget {
  const NewPlanCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final NewPlanModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.check_box_outline_blank),
        title: Text(data.taskTitle!),
        subtitle: Text(data.taskDescription!),
        trailing: TaskCreatedAt(createdAt: data.createdAt!),
      ),
    );
  }
}
