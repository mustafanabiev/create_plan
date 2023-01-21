import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/app/app.dart';
import 'package:create_plan/components/components.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:create_plan/packages/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage(this.newData, {super.key});
  final NewPlanModel newData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: HomeDetailView(newData),
    );
  }
}

class HomeDetailView extends StatelessWidget {
  const HomeDetailView(this.newData, {super.key});
  final NewPlanModel newData;
  static GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: newData.taskTitle);
    final descController = TextEditingController(text: newData.taskDescription);
    final taskDate =
        '${newData.createdAt!.toDate().day}.${newData.createdAt!.toDate().month}.${newData.createdAt!.toDate().year}';
    final taskTime = '${newData.createdAt!.toDate().hour}:${newData.createdAt!.toDate().minute}';
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      appBar: AppBar(
        title: const Text('HomeDetail'),
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
                TaskDateAndTimeWidget(
                  onPressed: () {},
                  dateOrTime: taskDate,
                  iconBtn: Icons.calendar_month,
                  titleBtn: AppText.addData,
                ),
                TaskDateAndTimeWidget(
                  onPressed: () {},
                  dateOrTime: taskTime,
                  iconBtn: Icons.schedule,
                  titleBtn: AppText.addTime,
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
                          context.read<NewPlanCubit>().updateNewPlan(
                                  newPlanModel: NewPlanModel(
                                userID: GetToken.getToken(context),
                                taskID: newData.taskID,
                                taskTitle: titleController.text,
                                taskDescription: descController.text,
                                taskDate: '18.01.2023',
                                createdAt: Timestamp.now(),
                              ));
                          Navigator.pop(context);
                        }
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Text(
                      AppText.changeTaskText,
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
