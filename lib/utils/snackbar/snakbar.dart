import 'package:flutter/material.dart';

class AppSnackBar {
  AppSnackBar._init();

  static AppSnackBar? _instance;
  static AppSnackBar get instance {
    _instance ??= AppSnackBar._init();
    return _instance!;
  }

  void snack(BuildContext context, {Widget? content, String? text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content ?? Text(text!),
      ),
    );
  }
}
