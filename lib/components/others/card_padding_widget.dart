import 'package:flutter/material.dart';

class CardPaddingWidget extends StatelessWidget {
  const CardPaddingWidget({super.key, required this.widget});
  final List<Widget> widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: widget,
        ),
      ),
    );
  }
}
