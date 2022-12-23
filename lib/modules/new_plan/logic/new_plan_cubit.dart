import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_plan_state.dart';

class NewPlanCubit extends Cubit<NewPlanState> {
  NewPlanCubit() : super(NewPlanInitial());
}
