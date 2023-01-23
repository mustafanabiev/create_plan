import 'package:create_plan/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.aboutUs),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        children: const [
          Text(
            'Тиркемени иштеп чыккандар',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20),
          Text(
            'Эгер сиз биздин тиркемеден  кандайдыр бир техникалык  кемчиликтерди байкасаңыз же тиркемеге жаңы өзгөчөлүктөрдү киргизүү боюнча кызыктуу идеяларыңыз болсо, биз ар дайым кубанычта болобуз !    Биз менен гитхаб аркылуу  байланышууңузду өтүнөбүз.  Сураныч, эч  тартынбаңыз! Бул тиркемени  биргеликте өнүктүрүүгө биз абдан  кызыктарбыз.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
