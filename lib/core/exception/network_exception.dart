class NetworkException implements Exception {
  NetworkException({this.message});
  final String? message;

  @override
  String toString() {
    return message ?? 'Network exception';
  }
}
