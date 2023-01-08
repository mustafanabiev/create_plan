import 'package:flutter/material.dart';

class NewPlanView extends StatelessWidget {
  const NewPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('New Plan'),
      ),
      body: const Text(''),
    );
  }
}
