import 'package:create_plan/modules/authentication/authentication.dart';
import 'package:create_plan/modules/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const pageKey = ValueKey('_pageKey');
const scaffoldKey = ValueKey('_scaffoldKey');

class AppRouter {
  AppRouter();

  final GoRouter route = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          // child: const HomePage(),
          child: const SignUpPage(),
        ),
      ),
      GoRoute(
        path: '/userProfile',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const HomePage(),
        ),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const SignUpPage(),
        ),
      ),
    ],
  );
}
