import 'package:create_plan/app/router/app_router_constants.dart';
import 'package:create_plan/modules/authentication/authentication.dart';
import 'package:create_plan/modules/home/view/home_page.dart';
import 'package:create_plan/modules/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const pageKey = ValueKey('_pageKey');
const scaffoldKey = ValueKey('_scaffoldKey');

class AppRouter {
  AppRouter();

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        // name: AppRouterConstants.home,
        path: '/',
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: HomePage(),
        ),
      ),
      GoRoute(
        // name: AppRouterConstants.userProfile,
        path: '/userProfile',
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: UserProfilePage(),
        ),
      ),
      GoRoute(
        // name: AppRouterConstants.login,
        path: '/login',
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: SignUpPage(),
        ),
      ),
    ],
    redirect: (context, state) async {
      bool isAuthenticated = false;
      if (!isAuthenticated && state.subloc == '/') {
        return '/login';
      }
      return null;
    },
    errorBuilder: (context, state) => Center(
      child: Text('${state.error}'),
    ),
  );
}
