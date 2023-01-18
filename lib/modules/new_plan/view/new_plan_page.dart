import 'package:create_plan/locator.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPlanPage extends StatelessWidget {
  const NewPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewPlanCubit>(),
      child: NewPlanView(),
    );
  }
}
