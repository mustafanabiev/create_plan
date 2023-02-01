import 'package:create_plan/components/components.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:create_plan/l10n/l10n.dart';
import 'package:create_plan/locator.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserProfileCubit>(),
      child: const UserProfileView(),
    );
  }
}

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  void initState() {
    context.read<UserProfileCubit>().getDate(GetToken.getToken(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profile),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            BlocBuilder<UserProfileCubit, UserProfileState>(
              builder: (context, state) {
                if (state.isLoading != true) {
                  return CardPaddingWidget(
                    widget: [
                      Row(
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(30),
                              child: Image.network(
                                state.signUpState!.userProFileImage!,
                              ),
                            ),
                          ),
                          AppSpace.sizedW15,
                          CardText(
                            text: state.signUpState!.name!,
                            text2: state.signUpState!.email!,
                          ),
                        ],
                      ),
                      AppSpace.sized25,
                      StreamBuilderWidget(
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CardText2(
                                  text: context.l10n.createTask,
                                  text2: '${snapshot.data!.docs.length}',
                                ),
                                CardText2(
                                  text: context.l10n.complatedTask,
                                  text2: '${snapshot.data!.docs.length}',
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            AppSpace.sized20,
            CardPaddingWidget(
              widget: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.l10n.statistic,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppSpace.sized20,
                const LineCharWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LineCharWidget extends StatelessWidget {
  const LineCharWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: getSections(),
        ),
        swapAnimationDuration: const Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear,
      ),
    );
  }
}

List<PieChartSectionData> getSections() => PieData.data
    .asMap()
    .map<int, PieChartSectionData>(
      (index, data) {
        final value = PieChartSectionData(
          color: data.color,
          value: data.percent,
          title: '${data.percent.toInt()}%',
          titleStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        );

        return MapEntry(index, value);
      },
    )
    .values
    .toList();
