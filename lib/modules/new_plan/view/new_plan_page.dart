import 'package:create_plan/locator.dart';
import 'package:create_plan/modules/new_plan/logic/new_plan_cubit.dart';
import 'package:create_plan/modules/new_plan/view/new_plan_view.dart';
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
