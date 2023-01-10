import 'package:flutter/material.dart';

class NewPlanView extends StatelessWidget {
  const NewPlanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
    );
  }
}
