import 'package:create_plan/app/router/app_router_constants.dart';
import 'package:create_plan/app/theme/custom/colors/app_colors.dart';
import 'package:create_plan/app/theme/custom/typography/app_text_style.dart';
import 'package:create_plan/components/input/text_form_field.dart';
import 'package:create_plan/constants/app_spaces.dart';
import 'package:create_plan/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  static final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();

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
                  controller: textEditingController,
                  labelText: AppText.emailText,
                  labelStyle: const TextStyle(fontSize: 18),
                  border: const OutlineInputBorder(),
                ),
                AppSpace.sized20,
                AppTextFormField(
                  obscureText: false,
                  controller: textEditingController,
                  hintText: AppText.passwordText,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off_outlined),
                  ),
                ),
                AppSpace.sized20,
                AppTextFormField(
                  obscureText: false,
                  controller: textEditingController,
                  hintText: AppText.repeatPasswordText,
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
                ElevatedButton(
                  onPressed: () {
                    context.go('/');
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    minimumSize: const Size(200, 40),
                  ),
                  child: Text(
                    AppText.signUpText,
                    style: AppTextStyle.roboto16w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
