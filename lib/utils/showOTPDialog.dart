// ignore_for_file: file_names

import 'package:flutter/material.dart';

void showOTPDialog({
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Enter OTP'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: codeController,
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          child: const Text('Done'),
        ),
      ],
    ),
  );
}
