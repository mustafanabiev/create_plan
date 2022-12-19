import 'package:create_plan/app/router/logic/token_cubit.dart';
import 'package:create_plan/modules/authentication/authentication.dart';
import 'package:create_plan/modules/home/view/home_page.dart';
import 'package:create_plan/modules/user_profile/user_profile.dart';
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
        pageBuilder: (context, state) => const MaterialPage(
          child: HomePage(),
        ),
      ),
      GoRoute(
        path: '/userProfile',
        pageBuilder: (context, state) => const MaterialPage(
          child: UserProfilePage(),
        ),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: pageKey,
          child: SignInView(),
        ),
      ),
    ],
    redirect: (context, state) {
      final loggedIn = tokenState.token != null;
      final loggingIn = state.subloc == '/login';
      if (!loggedIn) {
        return loggingIn ? null : '/login';
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
