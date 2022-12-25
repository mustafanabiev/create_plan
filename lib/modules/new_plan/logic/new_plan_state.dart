part of 'new_plan_cubit.dart';

abstract class NewPlanState extends Equatable {
  const NewPlanState();

  @override
  List<Object> get props => [];
}

class NewPlanLoading extends NewPlanState {}

class NewPlanDate extends NewPlanState {
  const NewPlanDate({this.dateTime});
  final DateTime? dateTime;

  @override
  List<Object> get props => [dateTime!];
}

class NewPlanTime extends NewPlanState {
  const NewPlanTime({this.startTime, this.endTime});
  final String? startTime;
  final String? endTime;

  @override
  List<Object> get props => [startTime!, endTime!];
}
