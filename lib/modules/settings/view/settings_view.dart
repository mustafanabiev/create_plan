import 'package:create_plan/app/app.dart';
import 'package:create_plan/components/components.dart';
import 'package:create_plan/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Container(
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: Assets.images.google.image().image,
                ),
              ),
              child: const SignOutApp(),
            ),
          ),
          ListTile(
            onTap: () => context.go('/theme'),
            title: Text('Language', style: AppTextStyle.roboto16w500),
          ),
          ListTile(
            onTap: () => context.go('/theme'),
            title: Text('Theme', style: AppTextStyle.roboto16w500),
          ),
          ListTile(
            onTap: () => context.go('/theme'),
            title: Text('About Us', style: AppTextStyle.roboto16w500),
          ),
        ],
      ),
    );
  }
}
