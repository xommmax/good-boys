abstract class LocalStorageProvider {
  Future<void> set(String key, dynamic value);
  Future<T> get<T>(String key);
  Future<void> remove(String key);
  Future<Stream<T>> listen<T>(String key);
}
