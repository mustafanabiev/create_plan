import 'package:create_plan/components/components.dart';
import 'package:create_plan/l10n/l10n.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        onPressed: () => showMyDialog(
          context,
          AlertNewPlan(
            onPressed: () {
              context.go('/newPlan');
              Navigator.pop(context);
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: context.read<MainCubit>().change,
        selectedIndex: context.watch<MainCubit>().state,
        destinations: [
          NavigationDestination(
            key: const Key('home'),
            icon: const Icon(Icons.home),
            label: context.l10n.home,
          ),
          NavigationDestination(
            key: const Key('profile'),
            icon: const Icon(Icons.person),
            label: context.l10n.profile,
          ),
        ],
      ),
    );
  }
}
