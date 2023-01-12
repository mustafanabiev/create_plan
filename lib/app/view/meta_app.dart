import 'package:create_plan/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(context, context.watch<TokenCubit>().state).router;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<AppCubit>().state.theme.themeData,
      routerConfig: router,
    );
  }
}