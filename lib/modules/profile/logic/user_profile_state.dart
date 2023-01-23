part of 'user_profile_cubit.dart';

class UserProfileState {
  const UserProfileState({
    this.signUpState,
    this.authFailureState,
    this.isLoading = false,
  });

  final UserModel? signUpState;
  final Failure? authFailureState;
  final bool? isLoading;

  UserProfileState copyWith({
    UserModel? signUpState,
    Failure? authFailureState,
    bool isLoading = false,
  }) {
    return UserProfileState(
      signUpState: signUpState ?? this.signUpState,
      authFailureState: authFailureState ?? this.authFailureState,
      isLoading: isLoading,
    );
  }
}
