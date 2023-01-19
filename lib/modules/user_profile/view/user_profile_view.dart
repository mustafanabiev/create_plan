import 'package:create_plan/components/components.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:create_plan/gen/assets.gen.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.profile),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            CardPaddingWidget(
              widget: [
                Row(
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(30),
                        child: Assets.images.google.image(),
                      ),
                    ),
                    AppSpace.sizedW15,
                    const CardText(
                      text: 'Mustafa Nabiev',
                      text2: 'nabiev@gmail.com',
                    ),
                  ],
                ),
                AppSpace.sized25,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CardText(
                      text: '120',
                      text2: 'Create Task',
                    ),
                    CardText(
                      text: '80',
                      text2: 'Complated Task',
                    ),
                  ],
                ),
              ],
            ),
            AppSpace.sized20,
            CardPaddingWidget(
              widget: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppText.statistic,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppSpace.sized20,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProgressBarWidget(
                        item: percents[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
