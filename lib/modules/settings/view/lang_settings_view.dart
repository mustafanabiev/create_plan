import 'package:flutter/material.dart';

class LangSettingsView extends StatelessWidget {
  const LangSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сураныч тилди тандаңыз.'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: const Text('Кыргыз тили'),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
