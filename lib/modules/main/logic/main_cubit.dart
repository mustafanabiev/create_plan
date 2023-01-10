import 'package:bloc/bloc.dart';

class MainCubit extends Cubit<int> {
  MainCubit() : super(0);

  void change(int value) => value != state ? emit(value) : {};
}
