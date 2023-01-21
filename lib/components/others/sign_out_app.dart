import 'package:create_plan/app/app.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutApp extends StatelessWidget {
  const SignOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () =>
                context.read<AuthenticationCubit>().signOut(context),
            icon: const Icon(Icons.logout, color: AppColors.red),
          );
        },
      ),
    );
  }
}
