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
        builder: (context, state) =>const SignUpPage(),
        // builder: (context, state) =>const HomePage(),
      ),
      GoRoute(
        path: '/userProfile',
        builder: (context, state) =>const UserProfilePage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) =>const HomePage(),
      ),
      // GoRoute(
      //   // name: AppRouterConstants.home,
      //   path: '/',
      //   pageBuilder: (context, state) => const MaterialPage<void>(
      //     child: HomePage(),
      //   ),
      // ),
    ],
    // redirect: (context, state) async {
    //   bool isAuthenticated = false;
    //   if (!isAuthenticated) {
    //     return '/login';
    //   }
    //   // return null;
    // },
    errorBuilder: (context, state) => Center(
      child: Text('${state.error}'),
    ),
  );
}
