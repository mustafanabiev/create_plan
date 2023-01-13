import 'dart:async';
import 'dart:developer';

import 'package:create_plan/app/app.dart';
import 'package:create_plan/app/service/theme_service.dart';
import 'package:create_plan/core/cache/token.dart';
import 'package:create_plan/locator.dart';
import 'package:create_plan/modules/authentication/authentication.dart';
import 'package:create_plan/modules/home/logic/home_cubit.dart';
import 'package:create_plan/modules/user_profile/logic/user_profile_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  final dir = await path.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  final tHive = await Hive.openBox<String>(userUidBox);
  final boxApp = await Hive.openBox<String>('app');
  final boxReadTheme = await Hive.openBox<int>('read-theme');

  await setup(tHive, boxApp, boxReadTheme);

  await runZonedGuarded(
    () async => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<TokenCubit>()),
          BlocProvider(create: (context) => sl<AuthenticationCubit>()),
          BlocProvider(create: (context) => AppCubit(sl<ThemeService>())),
          BlocProvider(create: (context) => sl<HomeCubit>()),
          BlocProvider(create: (context) => sl<UserProfileCubit>()),
        ],
        child: const MyApp(),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
