import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/packages/model/user_model.dart';
import 'package:create_plan/packages/repo/user_repo/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'new_plan_state.dart';

class NewPlanCubit extends Cubit<NewPlanState> {
  final UserRepo userRepo;

  NewPlanCubit({required this.userRepo}) : super(NewPlanLoading());

  void updateDate({DateTime? dateTime}) {
    emit(NewPlanLoading());
    if (dateTime != null) {
      emit(
        NewPlanDate(dateTime: dateTime),
      );
    } else {
      log('Error DateTime');
    }
  }

  void updateTime({String? startTime, String? endTime}) {
    emit(NewPlanLoading());
    if (startTime != null || endTime != null) {
      emit(NewPlanTime(startTime: startTime, endTime: endTime));
    } else {
      log('Error DateTime');
    }
  }

  void sendDataToFirebase({
    required BuildContext context,
    String? userID,
    String? title,
    String? note,
    String? date,
    Timestamp? createdAt,
  }) async {
    emit(NewPlanLoading());
    await userRepo.updateUser(
      context: context,
      user: UserModel(
        userID: userID,
        title: title,
        note: note,
        date: date,
        createdAt: createdAt,
      ),
    );
  }
}
