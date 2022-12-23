import 'package:create_plan/app/router/logic/token_cubit.dart';
import 'package:create_plan/app/theme/theme.dart';
import 'package:create_plan/components/input/text_form_field.dart';
import 'package:create_plan/constants/app_spaces.dart';
import 'package:create_plan/constants/app_text.dart';
import 'package:create_plan/modules/authentication/logic/authentication_cubit.dart';
import 'package:create_plan/modules/authentication/view/sign_up/sign_up_page.dart';
import 'package:create_plan/utils/snackbar/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);
  static final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: fromKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSpace.sized80,
                Text(
                  AppText.signInText,
                  style: AppTextStyle.robotoTextColor30w800,
                ),
                AppSpace.sized20,
                AppTextFormField(
                  obscureText: false,
                  controller: emailController,
                  labelText: AppText.emailText,
                  labelStyle: const TextStyle(fontSize: 18),
                  border: const OutlineInputBorder(),
                ),
                AppSpace.sized20,
                AppTextFormField(
                  obscureText: false,
                  controller: passwordController,
                  labelText: AppText.passwordText,
                  labelStyle: const TextStyle(fontSize: 18),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off_outlined),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(AppText.signUpText),
                  ),
                ),
                AppSpace.sized40,
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context
                              .read<AuthenticationCubit>()
                              .signInWithGoogle(context);
                        },
                        child: Image.asset(
                          'assets/images/google.png',
                          height: 45,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Icon(
                        Icons.facebook,
                        size: 50,
                        color: AppColors.appButtonColor,
                      ),
                    ),
                    const Expanded(
                      child: Icon(
                        Icons.apple,
                        size: 50,
                      ),
                    ),
                  ],
                ),
                AppSpace.sized40,
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  listener: (context, state) async {
                    if (state is SignUpState) {
                      await context
                          .read<TokenCubit>()
                          .save(state.user!.userID!);
                    } else if (state is UserFailureState) {
                      AppSnackBar.instance.snack(context);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (fromKey.currentState!.validate()) {
                          emailController.clear;
                          passwordController.clear;
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            context.read<AuthenticationCubit>().signIn(
                                  context,
                                  emailController.text,
                                  passwordController.text,
                                );
                          }
                        }
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        minimumSize: const Size(200, 60),
                      ),
                      child: Text(
                        AppText.signInText,
                        style: AppTextStyle.roboto16w500,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
