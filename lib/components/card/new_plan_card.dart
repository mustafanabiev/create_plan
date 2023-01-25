import 'package:create_plan/components/components.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPlanCard extends StatelessWidget {
  const NewPlanCard({
    super.key,
    required this.data,
    required this.onTap,
  });

  final NewPlanModel data;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: const CheckBoxWidget(),
        title: Text(data.taskTitle!),
        subtitle: Text(data.taskDescription!),
        trailing: TaskCreatedAt(createdAt: data.createdAt!),
      ),
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, bool>(
      builder: (context, state) {
        return Checkbox(
          value: state,
          onChanged: (bool? value) => context.read<HomeCubit>().change(),
        );
      },
    );
  }
}
