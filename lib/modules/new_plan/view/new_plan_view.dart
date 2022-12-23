import 'package:create_plan/app/theme/custom/typography/app_text_style.dart';
import 'package:create_plan/components/form/form_task.dart';
import 'package:create_plan/constants/app_spaces.dart';
import 'package:create_plan/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPlanView extends StatelessWidget {
  NewPlanView({Key? key}) : super(key: key);
  static final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  emailController: emailController,
                  text: AppText.title,
                  hintText: 'Enter title here.',
                ),
              ),
              const Spacer(),
              SizedBox(
                child: FormTask(
                  emailController: emailController,
                  text: AppText.noteTitle,
                  hintText: 'Enter note here.',
                ),
              ),
              const Spacer(),
              SizedBox(
                child: FormTask(
                  emailController: emailController,
                  text: AppText.dateTitle,
                  hintText: 'Enter date here.',
                  icon: Icons.calendar_month_outlined,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  FormTask(
                    emailController: emailController,
                    text: AppText.startTimeTitle,
                    hintText: 'Start Time',
                    icon: Icons.access_time_outlined,
                  ),
                  AppSpace.sizedW15,
                  FormTask(
                    emailController: emailController,
                    text: AppText.endTimeTitle,
                    hintText: 'End Time',
                    icon: Icons.access_time_outlined,
                  ),
                ],
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
                      context.go('/');
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
