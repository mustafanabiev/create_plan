import 'package:create_plan/constants/constants.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    super.key,
    required this.item,
  });
  final Percent item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 45.0,
            lineWidth: 5.0,
            percent: item.percent,
            center: Text(
              '${item.text}%',
              style: const TextStyle(fontSize: 26),
            ),
            backgroundColor: Colors.grey,
            progressColor: Colors.red,
          ),
          AppSpace.sized10,
          Text(
            item.name,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
