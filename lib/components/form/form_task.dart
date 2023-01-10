import 'package:create_plan/app/theme/theme.dart';
import 'package:create_plan/components/input/text_form_field.dart';
import 'package:create_plan/constants/app_spaces.dart';
import 'package:flutter/material.dart';

class FormTask extends StatelessWidget {
  const FormTask({
    Key? key,
    required this.emailController,
    required this.text,
    required this.hintText,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final TextEditingController emailController;
  final String text;
  final String hintText;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: AppTextStyle.robotoTextColorBlack18w500,
            ),
          ),
          AppSpace.sized5,
          AppTextFormField(
            maxLines: 1,
            controller: emailController,
            obscureText: false,
            hintText: hintText,
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(icon),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }
}
