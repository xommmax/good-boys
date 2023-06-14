import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage_api/src/provider/local_storage_provider.dart';

class HiveLocalStorageProvider implements LocalStorageProvider {
  bool isHiveInit = false;

  @override
  Future<void> set(String key, value) async {
    final box = await _getStorage();
    return box.put(key, value);
  }

  @override
  Future<T> get<T>(String key) async {
    final box = await _getStorage();
    return box.get(key);
  }

  @override
  Future<void> remove(String key) async {
    final box = await _getStorage();
    return box.delete(key);
  }

  @override
  Future<Stream<T>> listen<T>(String key) async {
    final box = await _getStorage();
    return box.watch(key: key).map((event) => event.value);
  }

  Future<Box> _getStorage() async {
    if (!isHiveInit) {
      await Hive.initFlutter();
      isHiveInit = true;
    }
    return Hive.openBox('generalBox');
  }
}
