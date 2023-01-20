import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/core/core.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:flutter/cupertino.dart';

part 'new_plan_state.dart';

class NewPlanCubit extends Cubit<NewPlanState> {
  final UserRepo userRepo;
  NewPlanCubit({required this.userRepo}) : super(const NewPlanState());

  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamUser() {
    return userRepo.getStreamUser();
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
