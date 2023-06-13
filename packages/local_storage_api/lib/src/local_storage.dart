import 'package:local_storage_api/src/local_storage_provider.dart';

class LocalStorage {
  const LocalStorage([this.provider = const SPLocalStorageProvider()]);

  final LocalStorageProvider provider;

  Future<void> set(String key, dynamic value) => provider.set(key, value);

  Future<Object?> get(String key) => provider.get(key);

  Future<void> remove(String key) => provider.remove(key);
}
