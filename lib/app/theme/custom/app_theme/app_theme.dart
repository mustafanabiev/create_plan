import 'package:create_plan/app/theme/theme.dart';
import 'package:flutter/material.dart';

class AppTheme with CompomnentTheme {
  final ColorScheme colorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff3473E6),
    onPrimary: Color(0xFFE5E5E5),
    secondary: Color(0xFF0D96FC),
    onSecondary: Color(0xFFE7F1FF),
    error: Color(0xFFEB4335),
    onError: Color(0xFFEB4335),
    background: AppColors.green,
    onBackground: Color(0xFFE5E5E5),
    surface: Color(0xFF000000),
    onSurface: Color(0xff34A853),
  );

  ThemeData light([Color? targetColor]) {
    return ThemeData.light().copyWith(
      colorScheme: colorScheme,
      appBarTheme: appBarTheme(colorScheme),
      cardTheme: cardTheme(),
      listTileTheme: listTileTheme(colorScheme),
      bottomAppBarTheme: bottomAppBarTheme(colorScheme),
      bottomNavigationBarTheme: bottomNavigationBarTheme(colorScheme),
      tabBarTheme: tabBarTheme(colorScheme),
      buttonTheme: buttonTheme(colorScheme),
      inputDecorationTheme: inputDecorationTheme(colorScheme),
      elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
      useMaterial3: true,
    );
  }
}
