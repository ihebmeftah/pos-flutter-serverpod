import 'package:get_storage/get_storage.dart';
import 'package:pos_client/pos_client.dart';


class LocalStorage {
  // Private constructor
  LocalStorage._internal();

  // Singleton instance
  static final LocalStorage _instance = LocalStorage._internal();

  // Factory constructor to return the same instance
  factory LocalStorage() => _instance;

  // GetStorage instance
  late final GetStorage _storage;

  // Initialize storage
  Future<void> init() async {
    await GetStorage.init();
    _storage = GetStorage();
  }

  
  Future<bool> saveBuilding(Building v) async {
    await _storage.write('building', v.toJson());
    return true;
  }

  Building? get building {
    if (!_storage.hasData('building')) return null;
    return Building.fromJson(_storage.read('building'));
  }


  Future<bool> clear() async {
    await _storage.erase();
    return true;
  }
}