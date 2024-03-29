import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/core/core.dart';
import 'package:create_plan/packages/packages.dart';

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
    // ignore: unnecessary_null_comparison
    if (newplan != null) {
      (newplan) => emit(state.copyWith(signUpState: newplan));
    } else {
      log('There is an error on the server');
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser(String userID) {
    return newPlanRepo.getStreamUser(userID);
  }

  void getUser({String? userID}) async {
    emit(state.copyWith(isLoading: true));

    final user = await userRepo.getUser(userID: userID!);
    user.fold(
      (error) async => emit(state.copyWith(authFailureState: error)),
      (user) async => emit(state.copyWith(signUpState: user)),
    );
  }

  void updateNewPlan({NewPlanModel? newPlanModel}) async {
    emit(state.copyWith(isLoading: true));
    await newPlanRepo.updateNewPlan(newPlanModel: newPlanModel!);
  }

  void deleteNewPlan({required String userID, required String planID}) async {
    emit(state.copyWith(isLoading: true));
    await newPlanRepo.deleteUser(userID: userID, planID: planID);
  }
}
