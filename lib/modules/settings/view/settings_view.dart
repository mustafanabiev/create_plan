import 'package:create_plan/app/app.dart';
import 'package:create_plan/components/components.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  void initState() {
    context.read<UserProfileCubit>().getDate(GetToken.getToken(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          BlocBuilder<UserProfileCubit, UserProfileState>(
            builder: (context, state) {
              if (state.isLoading != true) {
                return DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        state.signUpState!.userProFileImage!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const SignOutApp(),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          ListTile(
            onTap: () => context.go('/lang'),
            title: Text('Language', style: AppTextStyle.roboto16w500),
          ),
          ListTile(
            onTap: () => context.go('/theme'),
            title: Text('Theme', style: AppTextStyle.roboto16w500),
          ),
          ListTile(
            onTap: () => context.go('/aboutUs'),
            title: Text('About Us', style: AppTextStyle.roboto16w500),
          ),
        ],
      ),
    );
  }
}
