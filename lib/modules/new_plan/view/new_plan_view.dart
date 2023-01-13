import 'package:create_plan/app/theme/theme.dart';
import 'package:create_plan/components/components.dart';
import 'package:create_plan/constants/app_spaces.dart';
import 'package:create_plan/constants/app_text.dart';
import 'package:flutter/material.dart';

class NewPlanView extends StatelessWidget {
  NewPlanView({super.key});
  final titleController = TextEditingController();
  final descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFDFDFD),
      appBar: AppBar(
        title: const Text(AppText.newTask),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  onPressed: () {},
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
    );
  }
}
