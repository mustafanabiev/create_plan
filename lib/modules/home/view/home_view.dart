import 'package:create_plan/modules/modules.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: SettingView()),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return const Card(
            child: ListTile(
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('HomePage'),
            ),
          );
        },
      ),
    );
  }
}

/*
BlocBuilder<NewPlanCubit, NewPlanState>(
        builder: (context, state) {
          if (state.isLoading != true) {
            if (state.signUpState!.userID != null) {
              return Card(
                child: ListTile(
                  title: Text(state.signUpState!.taskTitle!),
                ),
              );
            } else {
              log('message');
            }
          } else if (state.authFailureState != null) {
            AppSnackBar.instance.snack(
              context,
              text: state.authFailureState.toString(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
          return const Text('Error');
        },
      ), */