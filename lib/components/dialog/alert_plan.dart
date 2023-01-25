import 'package:create_plan/app/app.dart';
import 'package:create_plan/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlertNewPlan extends StatelessWidget {
  const AlertNewPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AlertButton(
          onPressed: () {
            context.go('/newPlan');
            Navigator.pop(context);
          },
          text: context.l10n.addTask,
        ),
        const Divider(
          color: AppColors.dividerColor,
        ),
        AlertButton(
          onPressed: () {
            context.go('/newPlan');
            Navigator.pop(context);
          },
          text: context.l10n.addQuickNote,
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
        textAlign: TextAlign.center,
      ),
    );
  }
}
