import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreamBuilderWidget extends StatelessWidget {
  const StreamBuilderWidget({
    required this.builder,
    super.key,
  });
  final Widget Function(BuildContext, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<NewPlanCubit>().getStreamUser(GetToken.getToken(context)),
      builder: builder,
    );
  }
}
