import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageProvider {
  Future<void> set(String key, dynamic value);
  Future<Object?> get(String key);
  Future<void> remove(String key);
}

class SPLocalStorageProvider implements LocalStorageProvider {
  const SPLocalStorageProvider();

  @override
  Future<void> set(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
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
  Future<Object?> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
