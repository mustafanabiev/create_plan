part of 'token_cubit.dart';

class TokenState extends Equatable {
  const TokenState({this.token, this.newPlan});

  final String? token;
  final dynamic newPlan;

  @override
  List<Object?> get props => [token];

  TokenState copyWith({String? token, dynamic newPlan}) {
    return TokenState(
      token: token ?? this.token,
      newPlan: newPlan ?? this.newPlan,
    );
  }
}
