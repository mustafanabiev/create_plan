import 'package:create_plan/components/input/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  static final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Form(
        key: fromKey,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextFormField(
                    obscureText: false,
                    controller: textEditingController,
                    hintText: 'Аты-Жону',
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/');
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
