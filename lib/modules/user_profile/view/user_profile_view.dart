import 'package:create_plan/app/theme/custom/colors/app_colors.dart';
import 'package:create_plan/modules/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context.read<AuthenticationCubit>().signOut(context);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.red,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
