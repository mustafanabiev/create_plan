import 'package:create_plan/components/dialog/alert_dialog.dart';
import 'package:create_plan/modules/home/view/home_page.dart';
import 'package:create_plan/modules/main/logic/main_cubit.dart';
import 'package:create_plan/modules/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: const MainScreen(
        [
          HomePage(),
          UserProfilePage(),
        ],
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen(this.items, {super.key});
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[context.watch<MainCubit>().state],
      floatingActionButton: FloatingActionButton(
        onPressed: () => showMyDialog(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: context.read<MainCubit>().change,
        selectedIndex: context.watch<MainCubit>().state,
        destinations: const [
          NavigationDestination(
            key: Key('home'),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            key: Key('profile'),
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
