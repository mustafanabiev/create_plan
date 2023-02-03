import 'package:create_plan/app/app.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:create_plan/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertNewPlan extends StatelessWidget {
  const AlertNewPlan({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AlertButton(
          onPressed: onPressed,
          text: context.l10n.addTask,
        ),
        const Divider(
          color: AppColors.dividerColor,
        ),
        AlertButton(
          onPressed: onPressed,
          text: context.l10n.addQuickNote,
        ),
      ],
    );
  }
}

class AlertSignOut extends StatelessWidget {
  const AlertSignOut({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AlertButton(
          onPressed: () => Navigator.pop(context),
          text: AppText.back,
        ),
        AlertButton(
          onPressed: onPressed,
          text: AppText.ok,
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
