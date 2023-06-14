import 'package:local_storage_api/src/provider/local_storage_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPLocalStorageProvider implements LocalStorageProvider {
  const SPLocalStorageProvider();

  @override
  Future<void> set(String key, value) async {
    final prefs = await _getStorage();
    switch (value.runtimeType) {
      case bool:
        prefs.setBool(key, value);
        break;
      case double:
        prefs.setDouble(key, value);
        break;
      case int:
        prefs.setInt(key, value);
        break;
      case String:
        prefs.setString(key, value);
        break;
      default:
        if (value is List<String>) {
          prefs.setStringList(key, value);
        } else {
          throw ArgumentError('Unsupported value type', 'value');
        }
    }
  }

  @override
  Future<T> get<T>(String key) async {
    final prefs = await _getStorage();
    return prefs.get(key) as T;
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await _getStorage();
    prefs.remove(key);
  }

  @override
  Future<Stream<T>> listen<T>(String key) {
    throw UnimplementedError();
  }

  Future<SharedPreferences> _getStorage() => SharedPreferences.getInstance();
}
