import 'dart:async';
import 'dart:developer';

import 'package:create_plan/app/meta_app.dart';
import 'package:create_plan/locator.dart';
import 'package:create_plan/modules/authentication/authentication.dart';
import 'package:create_plan/modules/home/logic/home_cubit.dart';
import 'package:create_plan/modules/user_profile/logic/user_profile_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  await setup();

  await runZonedGuarded(
    () async => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<AuthenticationCubit>()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => UserProfileCubit()),
        ],
        child: const MyApp(),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
