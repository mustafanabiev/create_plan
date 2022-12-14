class AuthException implements Exception {
  AuthException({this.message});
  final String? message;

  @override
  String toString() {
    return message ?? 'Auth Exception';
  }
}
