import 'package:local_storage_api/src/provider/hive_provider.dart';
import 'package:local_storage_api/src/provider/local_storage_provider.dart';

class LocalStorage {
  LocalStorage({LocalStorageProvider? provider})
      : _provider = provider ?? HiveLocalStorageProvider();

  final LocalStorageProvider _provider;

  Future<void> set(String key, dynamic value) => _provider.set(key, value);

  Future<T> get<T>(String key) => _provider.get<T>(key);

  Future<void> remove(String key) => _provider.remove(key);

  Future<Stream<T>> listen<T>(String key) => _provider.listen<T>(key);
}
