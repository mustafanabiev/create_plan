import 'package:bloc/bloc.dart';

class PassTextFormFieldCubit extends Cubit<bool> {
  PassTextFormFieldCubit() : super(true);

  void change() {
    emit(!state);
  }
}
