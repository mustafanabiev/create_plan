import 'package:create_plan/components/components.dart';
import 'package:create_plan/constants/constants.dart';
import 'package:create_plan/locator.dart';
import 'package:create_plan/modules/modules.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserProfileCubit>(),
      child: const UserProfileView(),
    );
  }
}

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

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
        title: const Text(AppText.profile),
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
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CardText(
                                  text: 'Create Task',
                                  text2: '${snapshot.data!.docs.length}',
                                ),
                                CardText(
                                  text: 'Complated Task',
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
