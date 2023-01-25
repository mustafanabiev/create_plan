import 'package:create_plan/components/components.dart';
import 'package:create_plan/l10n/l10n.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:create_plan/packages/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    return Scaffold(
      drawer: const Drawer(child: SettingView()),
      appBar: AppBar(
        title: Text(context.l10n.homePage),
      ),
      body: StreamBuilderWidget(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = (snapshot.data!.docs).map(
              (e) => NewPlanModel.fromJson(json: e.data(), taskID: e.id),
            );
            return ListView(
              children: messages
                  .map(
                    (e) => NewPlanCard(
                      data: e,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeDetailPage(e),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
