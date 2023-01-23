import 'package:bloc/bloc.dart';
import 'package:create_plan/core/core.dart';
import 'package:create_plan/packages/packages.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final UserRepo userRepo;
  UserProfileCubit({required this.userRepo}) : super(const UserProfileState());

  void getDate(String userID) async {
    emit(state.copyWith(isLoading: true));

    final user = await userRepo.getUser(userID: userID);
    user.fold(
      (error) => emit(state.copyWith(authFailureState: error)),
      (user) => emit(state.copyWith(signUpState: user)),
    );
  }
}
