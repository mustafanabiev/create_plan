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
        path: '/',
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: pageKey,
          child: HomePage(),
          // child: const SignUpPage(),
        ),
      ),
      GoRoute(
        path: '/userProfile',
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: pageKey,
          child: UserProfilePage(),
        ),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: pageKey,
          child: SignUpPage(),
        ),
      ),
    ],
  );
}
