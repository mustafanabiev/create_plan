import 'package:create_plan/app/app.dart';
import 'package:create_plan/components/components.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:create_plan/packages/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userID = context.read<TokenCubit>().state.token;
    return Scaffold(
      drawer: const Drawer(child: SettingView()),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: StreamBuilder(
        stream: context.read<NewPlanCubit>().getStreamUser(userID!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = (snapshot.data!.docs).map(
              (e) => NewPlanModel.fromJson(e.data()),
            );
            return ListView(
              children: messages.map((e) => NewPlanCard(data: e)).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
