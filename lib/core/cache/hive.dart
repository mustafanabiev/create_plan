import 'package:create_plan/core/core.dart';
import 'package:hive/hive.dart';

class HiveService {
  HiveService(this.hive);

  final HiveInterface hive;

  Future<void> save<T>({
    required String boxName,
    required String key,
    required T value,
  }) async {
    try {
      final box = await hive.openBox<T>(boxName);
      await box.put(key, value);
      await box.close();
    } catch (e) {
      throw CacheException(message: 'hive service save error $e');
    }
  }

  Future<T?> read<T>({
    required String boxName,
    required String key,
  }) async {
    try {
      final box = await hive.openBox<T>(boxName);
      final val = box.get(key);
      await box.close();
      return val;
    } catch (e) {
      throw CacheException(message: 'hive service read error $e');
    }
  }

  Future<void> clear<T>(String boxName) async {
    try {
      final box = await hive.openBox<T>(boxName);
      await box.clear();
      await box.close();
    } catch (e) {
      throw CacheException(message: 'hive service clear error $e');
    }
  }
}
