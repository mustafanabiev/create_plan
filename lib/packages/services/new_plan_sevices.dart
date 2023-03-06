import 'package:create_plan/core/core.dart';

class NewPlanServices {
  const NewPlanServices(this.storage);

  final AppCache<String> storage;

  static const String _newPlanStorageKey = 'newPlan';

  dynamic init() {
    return storage.read(key: newPlanStorageKey);
  }

  Future saveNewPlan(dynamic value) async {
    await storage.save(key: newPlanStorageKey, value: value);
  }

  String get newPlanStorageKey => _newPlanStorageKey;
}
