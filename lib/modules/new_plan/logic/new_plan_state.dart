part of 'new_plan_cubit.dart';

class NewPlanState {
  const NewPlanState({
    this.signUpState,
    this.authFailureState,
    this.isLoading = false,
    this.newPlan,
  });

  final UserModel? signUpState;
  final Failure? authFailureState;
  final bool? isLoading;
    final dynamic newPlan;

  NewPlanState copyWith({
    UserModel? signUpState,
    Failure? authFailureState,
    bool isLoading = false,
    dynamic newPlan,
  }) {
    return NewPlanState(
      signUpState: signUpState ?? this.signUpState,
      authFailureState: authFailureState ?? this.authFailureState,
      isLoading: isLoading,
      newPlan: newPlan ?? this.newPlan,
    );
  }
}
