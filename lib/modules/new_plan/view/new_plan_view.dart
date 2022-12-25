import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/app/router/logic/token_cubit.dart';
import 'package:create_plan/app/theme/custom/typography/app_text_style.dart';
import 'package:create_plan/components/form/form_task.dart';
import 'package:create_plan/constants/app_spaces.dart';
import 'package:create_plan/constants/app_text.dart';
import 'package:create_plan/modules/new_plan/logic/new_plan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NewPlanView extends StatelessWidget {
  NewPlanView({Key? key}) : super(key: key);
  static final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userID = context.read<TokenCubit>().state.token;
    var selectedDate = DateTime.now();
    String startTime = DateFormat('hh:mm a').format(selectedDate).toString();
    String endTime = '-- : --';

    Future<DateTime?> getDateFromUser() async {
      DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2152),
      );
      if (pickerDate != null) {
        // ignore: use_build_context_synchronously
        context.read<NewPlanCubit>().updateDate(dateTime: pickerDate);
      } else {
        log('Error');
      }
      return pickerDate;
    }

    getTimeFromUser({required bool isStartTime}) async {
      var pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(startTime.split(':')[0]),
          minute: int.parse(startTime.split(':')[1].split(' ')[0]),
        ),
      );
      // ignore: use_build_context_synchronously
      String formatedTime = pickedTime!.format(context);
      // ignore: unnecessary_null_comparison
      if (pickedTime == null) {
        log('Time canceld');
      } else if (isStartTime == true) {
        // ignore: use_build_context_synchronously
        context.read<NewPlanCubit>().updateTime(startTime: formatedTime);
        // startTime = formatedTime;
      } else if (isStartTime == false) {
        // ignore: use_build_context_synchronously
        context.read<NewPlanCubit>().updateTime(endTime: formatedTime);
        // endTime = formatedTime;
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppText.addTaskText,
                  style: AppTextStyle.robotoTextColorBlack22w500,
                ),
              ),
              const Spacer(),
              SizedBox(
                child: FormTask(
                  emailController: titleController,
                  text: AppText.title,
                  hintText: 'Enter title here.',
                ),
              ),
              const Spacer(),
              SizedBox(
                child: FormTask(
                  emailController: noteController,
                  text: AppText.noteTitle,
                  hintText: 'Enter note here.',
                ),
              ),
              const Spacer(),
              BlocBuilder<NewPlanCubit, NewPlanState>(
                builder: (context, state) {
                  if (state is NewPlanLoading) {
                    return SizedBox(
                      child: FormTask(
                        emailController: dateController,
                        text: AppText.dateTitle,
                        hintText: DateFormat('dd-MM-yyyy').format(selectedDate),
                        icon: Icons.calendar_month_outlined,
                        onPressed: getDateFromUser,
                      ),
                    );
                  }
                  if (state is NewPlanDate) {
                    return SizedBox(
                      child: FormTask(
                        emailController: dateController,
                        text: AppText.dateTitle,
                        hintText:
                            DateFormat('dd-MM-yyyy').format(state.dateTime!),
                        icon: Icons.calendar_month_outlined,
                        onPressed: getDateFromUser,
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                },
              ),
              const Spacer(),
              BlocBuilder<NewPlanCubit, NewPlanState>(
                builder: (context, state) {
                  if (state is NewPlanLoading) {
                    return Row(
                      children: [
                        FormTask(
                          emailController: startTimeController,
                          text: AppText.startTimeTitle,
                          hintText: startTime,
                          icon: Icons.access_time_outlined,
                          onPressed: () {
                            getTimeFromUser(isStartTime: true);
                          },
                        ),
                        AppSpace.sizedW15,
                        FormTask(
                          emailController: endTimeController,
                          text: AppText.endTimeTitle,
                          hintText: endTime,
                          icon: Icons.access_time_outlined,
                          onPressed: () {
                            getTimeFromUser(isStartTime: false);
                          },
                        ),
                      ],
                    );
                  }
                  if (state is NewPlanTime) {
                    return Row(
                      children: [
                        FormTask(
                          emailController: startTimeController,
                          text: AppText.startTimeTitle,
                          hintText: state.startTime!,
                          icon: Icons.access_time_outlined,
                          onPressed: () {
                            getTimeFromUser(isStartTime: true);
                          },
                        ),
                        AppSpace.sizedW15,
                        FormTask(
                          emailController: endTimeController,
                          text: AppText.endTimeTitle,
                          hintText: state.endTime!,
                          icon: Icons.access_time_outlined,
                          onPressed: () {
                            getTimeFromUser(isStartTime: false);
                          },
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppText.colorTitle,
                          style: AppTextStyle.robotoTextColorBlack18w500,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          AppSpace.sizedW5,
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          AppSpace.sizedW5,
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // context.go('/');
                      context.read<NewPlanCubit>().sendDataToFirebase(
                            context: context,
                            userID: userID,
                            title: titleController.text,
                            note: noteController.text,
                            date: const NewPlanDate().dateTime.toString(),
                            createdAt: Timestamp.now(),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                    ),
                    child: Text(
                      AppText.createTaskTitle,
                      style: AppTextStyle.roboto16w500,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
