import 'package:bloc/bloc.dart';
import 'package:create_plan/core/core.dart';
import 'package:create_plan/packages/packages.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepo authRepo;
  final UserRepo userRepo;
  AuthenticationCubit({
    required this.authRepo,
    required this.userRepo,
  }) : super(const AuthenticationState());

  void signInWithGoogle(BuildContext context) async {
    final user = await authRepo.signInWithGoogle(context: context);
    user.fold(
      (error) => emit(state.copyWith(authFailureState: error)),
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
          (error) => emit(state.copyWith(authFailureState: error)),
          (user) => emit(state.copyWith(signUpState: user)),
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
