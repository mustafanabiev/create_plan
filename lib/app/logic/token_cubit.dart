import 'package:create_plan/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'token_state.dart';

class TokenCubit extends Cubit<TokenState> {
  TokenCubit({required this.tService})
      : super(TokenState(token: tService.read));

  final TokenService tService;

  Future<void> saveToken(String token) async {
    await tService.save(token);
    emit(TokenState(token: token));
  }

  Future<void> clear() async {
    await tService.clear();
    emit(const TokenState());
  }
}
