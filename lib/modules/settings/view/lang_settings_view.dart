import 'package:create_plan/components/components.dart';
import 'package:create_plan/l10n/l10n.dart';
import 'package:flutter/material.dart';

class LangSettingsView extends StatelessWidget {
  const LangSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.helloWorld),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: SelectLangFromListViewBuilder(),
      ),
    );
  }
}
