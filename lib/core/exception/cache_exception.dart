class CacheException implements Exception {
  CacheException({this.message});
  final String? message;

  @override
  String toString() {
    return message ?? '';
  }
}
