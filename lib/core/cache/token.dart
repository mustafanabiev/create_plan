import 'package:create_plan/core/exception/cache_exception.dart';
import 'package:hive/hive.dart';

const String userUidBox = 'userUidBox';
const String userUidKey = 'userUidKey';

class TokenService {
  TokenService(this.tHive);

  final Box<String> tHive;

  Future<void> save(String value) async {
    try { 
      await tHive.put(userUidKey, value);
    } catch (e) {
      throw CacheException(message: 'hive service save error $e');
    }
  }

  String? get read {
    try {
      return tHive.get(userUidKey);
    } catch (e) {
      throw CacheException(message: 'hive service read error $e');
    }
  }

  Future<void> clear() async {
    try {
      await tHive.clear();
    } catch (e) {
      throw CacheException(message: 'hive service clear error $e');
    }
  }
}
