import 'package:create_plan/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetToken {
  static getToken(BuildContext context) {
    return context.read<TokenCubit>().state.token;
  }
}
