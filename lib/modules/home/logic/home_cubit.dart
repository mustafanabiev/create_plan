import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<bool> {
  HomeCubit() : super(false);

  void change() {
    emit(!state);
  }
}
