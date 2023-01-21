import 'package:create_plan/app/app.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:flutter/material.dart';

class TaskDateAndTimeWidget extends StatelessWidget {
  const TaskDateAndTimeWidget({
    required this.onPressed,
    required this.titleBtn,
    required this.iconBtn,
    required this.dateOrTime,
    super.key,
  });

  final void Function()? onPressed;
  final String titleBtn;
  final IconData iconBtn;
  final String dateOrTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              dateOrTime == '' ? AppText.dueData : dateOrTime,
              style: AppTextStyle.robotoTGreyFromARGB18w500,
            ),
          ),
          Expanded(
            child: TextButton.icon(
              autofocus: true,
              onPressed: onPressed,
              icon: Icon(iconBtn),
              label: Text(titleBtn),
            ),
          ),
        ],
      ),
    );
  }
}
