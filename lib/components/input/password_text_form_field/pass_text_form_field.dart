import 'package:create_plan/components/input/password_text_form_field/cubit/pass_text_form_field_cubit.dart';
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
    this.border,
    this.hintStyle,
    this.keyboardType,
    this.labelStyle,
  });
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final bool? autofocus;
  final Widget? prefixixIcon;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassTextFormFieldCubit(),
      child: BlocBuilder<PassTextFormFieldCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            validator: (value) {
              if (value!.isEmpty) {
                return AppText.validatorPasswordMessage;
              }
              return null;
            },
            obscureText: state,
            decoration: InputDecoration(
              border: border,
              prefixIcon: prefixixIcon,
              labelText: labelText,
              hintText: hintText,
              hintStyle: hintStyle,
              labelStyle: labelStyle,
              suffixIcon: IconButton(
                icon: Icon(state ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  context.read<PassTextFormFieldCubit>().change();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
