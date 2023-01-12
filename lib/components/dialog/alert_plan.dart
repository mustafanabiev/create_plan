import 'package:create_plan/app/theme/theme.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlertNewPlan extends StatelessWidget {
  const AlertNewPlan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AlertButton(
          onPressed: () {
            context.go('/newPlan');
            Navigator.pop(context);
          },
          text: AppText.addTaskText,
        ),
        const Divider(
          color: AppColors.dividerColor,
        ),
        AlertButton(
          onPressed: () {
            context.go('/newPlan');
            Navigator.pop(context);
          },
          text: AppText.addQuickNoteText,
        ),
        const Divider(
          color: AppColors.dividerColor,
        ),
        AlertButton(
          onPressed: () {
            context.go('/newPlan');
            Navigator.pop(context);
          },
          text: AppText.addCheckListText,
        ),
      ],
    );
  }
}

class AlertButton extends StatelessWidget {
  const AlertButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.roboto18w500,
      ),
    );
  }
}
