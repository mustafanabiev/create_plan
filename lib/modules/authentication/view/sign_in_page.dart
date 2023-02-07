import 'dart:developer';

import 'package:create_plan/app/app.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:create_plan/gen/assets.gen.dart';
import 'package:create_plan/locator.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:create_plan/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthenticationCubit>(),
      child: const SignInView(),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              key: const Key('login-select-view'),
              AppText.createPlan,
              style: AppTextStyle.robotoText40w800,
            ),
            Text(
              AppText.mobileAppTitle,
              style: AppTextStyle.roboto18w500,
            ),
            AppSpace.sized40,
            BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) async {
                if (state.isLoading != true) {
                  if (state.signUpState!.userID != null) {
                    await context.read<TokenCubit>().save(state.signUpState!.userID!);
                  } else {
                    log('Error error');
                  }
                } else if (state.authFailureState != null) {
                  AppSnackBar.instance.snack(
                    context,
                    text: state.authFailureState.toString(),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton.icon(
                  key: Key('login-button'),
                  onPressed: () {
                    context.read<AuthenticationCubit>().signInWithGoogle(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 55),
                  ),
                  icon: Assets.images.google.image(height: 40),
                  label: const Text(
                    AppText.signInWithGoogle,
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
