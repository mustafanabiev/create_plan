import 'package:bloc/bloc.dart';
import 'package:create_plan/app/service/theme_service.dart';
import 'package:create_plan/app/theme/custom/custom_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.themeService) : super(AppState(themeService.init()));

  final ThemeService themeService;

  Future<void> changeMode({required bool isDark}) async {
    await themeService.setMode(isDark: isDark);
    emit(state.copyWith(
      theme: state.theme.copyWith(
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
    ));
  }

  Future<void> changeColor(int index, Color color) async {
    await themeService.setColor(index);
    emit(state.copyWith(theme: state.theme.copyWith(targetColor: color)));
  }
}
