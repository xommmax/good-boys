import 'package:local_storage_api/local_storage_api.dart';

class FavoritesRepository {
  FavoritesRepository({LocalStorage? localStorage})
      : _localStorage = localStorage ?? const LocalStorage();

  final LocalStorage _localStorage;
  static const String favoritesListKey = 'favoritesListKey';

  Future<bool> isFavorite(String key) async {
    List<String> favorites = await _getFavoritesList();
    return favorites.contains(key);
  }

  Future<void> setFavorite(String key, bool value) async {
    List<String> favorites = await _getFavoritesList();
    if (value) {
      favorites.add(key);
    } else {
      favorites.remove(key);
    }
    return _localStorage.set(favoritesListKey, favorites);
  }

  Future<List<String>> getFavorites() => _getFavoritesList();

  Future<List<String>> _getFavoritesList() async {
    final result = await _localStorage.get(favoritesListKey) as List<String>?;
    return result ?? [];
  }
}
