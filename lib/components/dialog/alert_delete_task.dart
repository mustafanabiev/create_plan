import 'package:create_plan/app/app.dart';
import 'package:create_plan/l10n/l10n.dart';
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
          context.l10n.deleteTask,
          style: AppTextStyle.roboto18w500,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.l10n.cancel),
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
              child: Text(context.l10n.ok),
            ),
          ],
        ),
      ],
    );
  }
}
