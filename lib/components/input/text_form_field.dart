import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefix;
  final Widget? prefixixIcon;
  final String? prefixText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final bool obscureText;
  final TextStyle? labelStyle;
  final int? maxLines;
  final TextStyle? hintStyle;
  final InputBorder? border;

  const AppTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.prefix,
    this.prefixixIcon,
    this.prefixText,
    this.suffix,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.autofocus,
    this.onChanged,
    required this.obscureText,
    this.labelStyle,
    this.maxLines,
    this.hintStyle,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: border,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        prefix: prefix,
        prefixIcon: prefixixIcon,
        suffix: suffix,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
