import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_plan/firebase_options.dart';
import 'package:create_plan/modules/authentication/authentication.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'packages/repo/user_repo/user_repo.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  final firebase = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final firebaseAuth = FirebaseAuth.instance;
  final firestoreDB = FirebaseFirestore.instance;

  // repositories
  sl
    ..registerFactory(
      () => AuthenticationCubit(
        authRepo: sl<AuthRepo>(),
        userRepo: sl<UserRepo>(),
      ),
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
    );
}
