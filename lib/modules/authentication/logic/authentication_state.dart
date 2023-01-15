part of 'authentication_cubit.dart';

class AuthenticationState {
  const AuthenticationState({
    this.signUpState,
    this.authFailureState,
    this.isLoading = false,
  });

  final UserModel? signUpState;
  final Failure? authFailureState;
  final bool? isLoading;

  AuthenticationState copyWith({
    UserModel? signUpState,
    Failure? authFailureState,
    bool isLoading = false,
  }) {
    return AuthenticationState(
      signUpState: signUpState ?? this.signUpState,
      authFailureState: authFailureState ?? this.authFailureState,
      isLoading: isLoading,
    );
  }
}
