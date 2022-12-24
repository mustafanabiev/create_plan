part of 'new_plan_cubit.dart';

abstract class NewPlanState extends Equatable {
  const NewPlanState();

  @override
  List<Object> get props => [];
}

class NewPlanLoading extends NewPlanState {}

class NewPlanDate extends NewPlanState {
  const NewPlanDate({
    this.dateTime,
    this.startTime,
    this.endTime,
  });
  final DateTime? dateTime;
  final String? startTime;
  final String? endTime;

  @override
  List<Object> get props => [dateTime!, startTime!, endTime!];
}
