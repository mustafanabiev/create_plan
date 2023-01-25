import 'package:create_plan/app/app.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertDeleteTask extends StatelessWidget {
  const AlertDeleteTask({
    super.key,
    required this.userID,
    required this.planID,
  });
  final String userID;
  final String planID;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Do you want to delete the task?',
          style: AppTextStyle.roboto18w500,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<NewPlanCubit>().deleteNewPlan(
                      userID: userID,
                      planID: planID,
                    );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainView(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ],
    );
  }
}
