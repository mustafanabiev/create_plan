import 'package:create_plan/app/app.dart';
import 'package:create_plan/components/components.dart';
import 'package:create_plan/core/core.dart';
import 'package:create_plan/l10n/l10n.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:create_plan/packages/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = context.watch<NewPlanCubit>().state;
    return Scaffold(
      drawer: const Drawer(child: SettingView()),
      appBar: AppBar(
        title: Text(context.l10n.homePage),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Main Page'),
            Text('${appCubit.newPlan ?? 'Nabiev'}'),
          ],
        ),
      ),
    );
  }
}
