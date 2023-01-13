import 'package:create_plan/app/app.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:create_plan/modules/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const pageKey = ValueKey('_pageKey');
const scaffoldKey = ValueKey('_scaffoldKey');

class AppRouter {
  AppRouter(this.context, this.tokenState);
  final BuildContext context;
  final TokenState tokenState;

  late final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainView(),
        routes: [
          GoRoute(
            path: 'theme',
            builder: (context, state) => const ThemeSettingsView(),
          ),
          GoRoute(
            path: 'newPlan',
            builder: (context, state) => const NewPlanPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingView(),
      ),
      GoRoute(
        path: '/signIn',
        builder: (context, state) => const SignInPage(),
      ),
    ],
    redirect: (context, state) {
      final loggedIn = tokenState.token != null;
      final loggingIn = state.subloc == '/signIn';
      if (!loggedIn) {
        return loggingIn ? null : '/signIn';
      }
      if (loggingIn) {
        return '/';
      }
      return null;
    },
    errorBuilder: (context, state) => Center(
      child: Text('${state.error}'),
    ),
  );
}
