part of 'new_plan_cubit.dart';

class NewPlanState {
  const NewPlanState({
    this.signUpState,
    this.authFailureState,
    this.isLoading = false,
  });

  final UserModel? signUpState;
  final Failure? authFailureState;
  final bool? isLoading;

  NewPlanState copyWith({
    UserModel? signUpState,
    Failure? authFailureState,
    bool isLoading = false,
  }) {
    return NewPlanState(
      signUpState: signUpState ?? this.signUpState,
      authFailureState: authFailureState ?? this.authFailureState,
      isLoading: isLoading,
    );
  }
}
