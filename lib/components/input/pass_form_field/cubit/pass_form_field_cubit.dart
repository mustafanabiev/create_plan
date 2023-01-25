import 'package:bloc/bloc.dart';

class PassFormFieldCubit extends Cubit<bool> {
  PassFormFieldCubit() : super(true);
  

  void change() {
    emit(!state);
  }
}
