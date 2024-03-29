import 'package:bloc/bloc.dart';
import 'package:create_plan/app/app.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(
    this.localService,
    this.themeService,
  ) : super(AppState(localService.init(), themeService.init()));

  final AppService localService;
  final ThemeService themeService;

  Future<void> changeLang(int index) async {
    final local = await localService.setLocale(index);
    emit(state.copyWith(currentLocale: local));
  }

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
