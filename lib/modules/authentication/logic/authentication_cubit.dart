import 'package:bloc/bloc.dart';
import 'package:create_plan/packages/model/user_model.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:create_plan/packages/repo/user_repo/user_repo.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepo authRepo;
  final UserRepo userRepo;
  AuthenticationCubit({
    required this.authRepo,
    required this.userRepo,
  }) : super(LoadingState());

  void signIn(BuildContext context, String email, String password) async {
    emit(LoadingState());

    await authRepo.signIn(
      context: context,
      email: email,
      password: password,
    );
  }

  void signUp(BuildContext context, String email, String password) async {
    emit(LoadingState());

    final user = await authRepo.signUp(
      context: context,
      email: email,
      password: password,
    );
    await user.fold(
      (error) async => emit(
        const AuthFailureState(''),
      ),
      (userCredential) async {
        final user = await userRepo.createNewUser(
          user: UserModel(
            userID: userCredential!.user!.uid,
            email: email,
            password: password,
          ),
        );

        user.fold(
          (error) => emit(const AuthFailureState('')),
          (user) {
            emit(SignUpState(user));
          },
        );
      },
    );
  }

  void signInWithGoogle(BuildContext context) async {
    final user = await authRepo.signInWithGoogle(context: context);
    await user.fold(
      (error) async => emit(
        const AuthFailureState(''),
      ),
      (userCredential) async {
        final user = await userRepo.createNewUser(
          user: UserModel(
            userID: userCredential!.user!.uid,
            name: userCredential.user!.displayName,
            email: userCredential.user!.email,
            phoneNumber: userCredential.user!.phoneNumber,
            userProFileImage: userCredential.user!.photoURL,
            refreshToken: userCredential.user!.refreshToken,
          ),
        );

        user.fold(
          (error) => emit(const AuthFailureState('')),
          (user) {
            emit(
              SignUpState(user),
            );
          },
        );
      },
    );
  }

  void signOut(BuildContext context) async {
    await authRepo.signOut(
      context: context,
    );
  }
}
