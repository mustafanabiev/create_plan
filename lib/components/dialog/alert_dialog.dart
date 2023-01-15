import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showMyDialog(BuildContext context, Widget widget) async {
  return showDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      content: widget,
    ),
  );
}
