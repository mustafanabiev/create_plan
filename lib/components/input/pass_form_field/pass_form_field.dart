import 'package:create_plan/components/input/pass_form_field/cubit/pass_form_field_cubit.dart';
import 'package:create_plan/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassFormField extends StatelessWidget {
  const PassFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.autofocus,
    this.labelText,
    this.prefixixIcon,
    this.hintStyle,
    this.border,
    this.suffix,
    this.labelStyle,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool? autofocus;
  final Widget? prefixixIcon;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final Widget? suffix;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassFormFieldCubit(),
      child: BlocBuilder<PassFormFieldCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return AppText.validatorPasswordMessage;
              }
              return null;
            },
            obscureText: state,
            decoration: InputDecoration(
              border: border,
              hintText: hintText,
              hintStyle: hintStyle,
              labelText: labelText,
              labelStyle: labelStyle,
              suffix: suffix,
              suffixIcon: IconButton(
                icon: Icon(
                  state
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  context.read<PassFormFieldCubit>().change();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
