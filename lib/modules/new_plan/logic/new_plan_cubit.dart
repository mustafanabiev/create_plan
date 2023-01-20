import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/core/core.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:flutter/cupertino.dart';

part 'new_plan_state.dart';

class NewPlanCubit extends Cubit<NewPlanState> {
  final NewPlanRepo newPlanRepo;
  final UserRepo userRepo;
  NewPlanCubit({
    required this.newPlanRepo,
    required this.userRepo,
  }) : super(const NewPlanState());

  void createNewPlan({required NewPlanModel newPlan}) async {
    emit(state.copyWith(isLoading: true));

    final newplan = await newPlanRepo.createNewPlan(newPlan: newPlan);
    if (newplan != null) {
      (newplan) => emit(state.copyWith(signUpState: newplan));
    } else {
      log('Error ================> Error');
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser(String userID) {
    return userRepo.getStreamUser(userID);
  }

  void getUser({String? userID}) async {
    emit(state.copyWith(isLoading: true));

    final user = await userRepo.getUser(userID: userID!);
    user.fold(
      (error) async => emit(state.copyWith(authFailureState: error)),
      (user) async => emit(state.copyWith(signUpState: user)),
    );
  }

  void updateData({
    required BuildContext context,
    String? userID,
    String? taskTitle,
    String? taskDescription,
    String? taskDate,
  }) async {
    emit(state.copyWith(isLoading: true));

    final user = await userRepo.updateUser(
      context: context,
      user: UserModel(userID: userID),
    );

    await user.fold(
      (error) async => emit(state.copyWith(authFailureState: error)),
      (user) async {
        final currentUser = await userRepo.getUser(userID: user.userID!);
        currentUser.fold(
          (error) async => emit(state.copyWith(authFailureState: error)),
          (user) async => emit(state.copyWith(signUpState: user)),
        );
      },
    );
  }
}
