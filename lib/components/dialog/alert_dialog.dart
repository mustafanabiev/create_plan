import 'package:create_plan/app/theme/custom/colors/app_colors.dart';
import 'package:create_plan/app/theme/custom/typography/app_text_style.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      content: Column(
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
      ),
    ),
  );
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
