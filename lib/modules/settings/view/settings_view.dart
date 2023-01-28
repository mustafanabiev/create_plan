import 'package:create_plan/app/app.dart';
import 'package:create_plan/components/components.dart';
import 'package:create_plan/gen/assets.gen.dart';
import 'package:create_plan/l10n/l10n.dart';
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
  Widget build(BuildContext context) {
    final appCubit = context.watch<AppCubit>();
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.drawerPhoto.image().image,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SignOutApp(),
                Text(
                  context.l10n.kg,
                  style: AppTextStyle.robotoTextColorWhite22w500,
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () => context.go('/lang'),
            title:
                Text(context.l10n.language, style: AppTextStyle.roboto16w500),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  appCubit.localService
                      .getName(appCubit.state.currentLocale.toLanguageTag()),
                ),
                const SizedBox(width: 17),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          ListTile(
            onTap: () => context.go('/theme'),
            title: Text(context.l10n.theme, style: AppTextStyle.roboto16w500),
          ),
          ListTile(
            onTap: () => context.go('/aboutUs'),
            title: Text(context.l10n.aboutUs, style: AppTextStyle.roboto16w500),
          ),
        ],
      ),
    );
  }
}
