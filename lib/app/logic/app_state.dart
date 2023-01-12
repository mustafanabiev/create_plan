part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState(this.theme);

  final CustomTheme theme;

  @override
  List<Object?> get props => [theme];

  AppState copyWith({CustomTheme? theme}) {
    return AppState(
      theme ?? this.theme,
    );
  }
}
