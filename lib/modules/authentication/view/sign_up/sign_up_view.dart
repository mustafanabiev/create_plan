import 'package:create_plan/app/router/logic/token_cubit.dart';
import 'package:create_plan/app/theme/custom/colors/app_colors.dart';
import 'package:create_plan/app/theme/custom/typography/app_text_style.dart';
import 'package:create_plan/components/input/text_form_field.dart';
import 'package:create_plan/constants/app_spaces.dart';
import 'package:create_plan/constants/app_text.dart';
import 'package:create_plan/modules/authentication/authentication.dart';
import 'package:create_plan/utils/snackbar/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  static final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final resetPasswordController = TextEditingController();

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
                  AppText.signUpText,
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
                AppSpace.sized20,
                AppTextFormField(
                  obscureText: false,
                  controller: resetPasswordController,
                  labelText: AppText.repeatPasswordText,
                  labelStyle: const TextStyle(fontSize: 18),
                  border: const OutlineInputBorder(),
                ),
                AppSpace.sized40,
                Row(
                  children: const [
                    Expanded(
                      child: Icon(
                        Icons.facebook,
                        size: 50,
                        color: AppColors.appButtonColor,
                      ),
                    ),
                    Expanded(
                      child: Icon(
                        Icons.facebook,
                        size: 50,
                        color: AppColors.appButtonColor,
                      ),
                    ),
                    Expanded(
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
                          resetPasswordController.clear;
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty &&
                              resetPasswordController.text.isNotEmpty) {
                            context.read<AuthenticationCubit>().signUp(
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
                        AppText.signUpText,
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
