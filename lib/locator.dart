import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/app/app.dart';
import 'package:create_plan/app/service/theme_service.dart';
import 'package:create_plan/core/cache/app_cache.dart';
import 'package:create_plan/core/cache/hive.dart';
import 'package:create_plan/core/cache/token.dart';
import 'package:create_plan/firebase_options.dart';
import 'package:create_plan/modules/authentication/authentication.dart';
import 'package:create_plan/modules/home/logic/home_cubit.dart';
import 'package:create_plan/modules/user_profile/user_profile.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'modules/new_plan/logic/new_plan_cubit.dart';

final sl = GetIt.instance;

Future<void> setup(
  Box<String> tHive,
  Box<String> boxApp,
  Box<int> boxReadTheme,
) async {
  final firebase = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final firebaseAuth = FirebaseAuth.instance;
  final firestoreDB = FirebaseFirestore.instance;

  // repositories
  sl
    ..registerFactory(
      () => TokenCubit(
        tService: sl<TokenService>(),
      ),
    )
    ..registerFactory(
      () => HomeCubit(),
    )
    ..registerFactory(
      () => UserProfileCubit(),
    )
    ..registerFactory(
      () => AuthenticationCubit(
        authRepo: sl<AuthRepo>(),
        userRepo: sl<UserRepo>(),
      ),
    )
    ..registerFactory(
      () => NewPlanCubit(),
    )
    ..registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(
        firebaseAuth: sl(),
      ),
    )
    ..registerLazySingleton<UserRepo>(
      () => UserRepoImpl(
        firestore: sl<FireStore>(),
      ),
    )

    // service
    ..registerLazySingleton<ThemeService>(
      () => ThemeService(
        sl<AppCache<String>>(),
      ),
    )
    ..registerLazySingleton<AppCache<String>>(() => AppCache(boxApp))
    ..registerLazySingleton<AppCache<int>>(() => AppCache(boxReadTheme))

    // data_source
    ..registerLazySingleton<FirebaseAuthentication>(
      () => FirebaseAuthImpl(
        firebaseAuth: FirebaseAuth.instance,
      ),
    )
    ..registerLazySingleton<FireStore>(
      () => FireStoreImpl(
        firestoreDB: sl<FirebaseFirestore>(),
      ),
    )
    ..registerLazySingleton(
      () => firebase,
    )
    ..registerLazySingleton(
      () => firebaseAuth,
    )
    ..registerLazySingleton(
      () => firestoreDB,
    )
    //core
    ..registerLazySingleton(
      () => TokenService(tHive),
    )
    ..registerLazySingleton(
      () => HiveService(Hive),
    );
}
