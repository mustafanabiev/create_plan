part of 'authentication_cubit.dart';

abstract class AuthenticationState {
  const AuthenticationState();

  List<Object> get props => [];

  get token => null;
}

class LoadingState extends AuthenticationState {}

class SignUpState extends AuthenticationState {
  final UserModel? user;

  const SignUpState(this.user);

  @override
  List<Object> get props => [user!];
}

class AuthFailureState extends AuthenticationState {
  final String? message;

  const AuthFailureState(this.message);

  @override
  List<Object> get props => [message!];
}

class UserFailureState extends AuthenticationState {
  final String? message;

  const UserFailureState(this.message);

  @override
  List<Object> get props => [message!];
}
