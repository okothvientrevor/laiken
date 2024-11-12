import 'package:get_storage/get_storage.dart';

class VLocalStorage {
  static final VLocalStorage _instance = VLocalStorage._internal();

  factory VLocalStorage() {
    return _instance;
  }

  VLocalStorage._internal();

  final _storage = GetStorage();

// Generic method to save data
  Future<void> saveData<V>(String key, V value) async {
    await _storage.write(key, value);
  }

  // Generic method to READ data
  Future<V?> readData<V>(String key) async {
    return _storage.read<V>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
