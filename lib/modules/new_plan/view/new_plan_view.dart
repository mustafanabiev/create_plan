import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/app/app.dart';
import 'package:create_plan/components/components.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:create_plan/packages/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewPlanView extends StatelessWidget {
  NewPlanView({super.key});

  static final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userID = context.read<TokenCubit>().state.token;
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      appBar: AppBar(
        title: const Text(AppText.newTask),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppText.title,
                  style: AppTextStyle.roboto18w500,
                ),
                AppSpace.sized10,
                AppTextFormField(
                  controller: titleController,
                  obscureText: false,
                  labelText: AppText.task,
                  maxLines: 1,
                ),
                AppSpace.sized20,
                Text(
                  AppText.description,
                  style: AppTextStyle.robotoTGrey18w500,
                ),
                AppSpace.sized10,
                AppTextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: descController,
                  obscureText: false,
                  hintText: AppText.description,
                  hintStyle: AppTextStyle.robotoTGrey16w500,
                  maxLines: 4,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                AppSpace.sized20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      AppText.dueData,
                      style: AppTextStyle.robotoTGreyFromARGB18w500,
                    ),
                    TextButton.icon(
                      autofocus: true,
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_month),
                      label: const Text(AppText.addData),
                    ),
                  ],
                ),
                AppSpace.sized20,
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.6,
                        45,
                      ),
                    ),
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        titleController.clear;
                        descController.clear;
                        if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
                          context.read<NewPlanCubit>().createNewPlan(
                                  newPlan: NewPlanModel(
                                userID: userID,
                                taskTitle: titleController.text,
                                taskDescription: descController.text,
                                taskDate: '18.01.2023',
                                createdAt: Timestamp.now(),
                              ));
                          context.go('/');
                        }
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Text(
                      AppText.addTaskText,
                      style: AppTextStyle.roboto16w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
