import 'package:isar/isar.dart';
import 'package:local_storage_api/local_storage_api.dart';
import 'package:local_storage_api/src/models/favorite/favorite.dart';
import 'package:path_provider/path_provider.dart';

class IsarLocalStorage implements LocalStorage {
  IsarLocalStorage() {
    _init();
  }

  late final Isar isar;

  Future<void> _init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([BreedSchema, FavoriteSchema], directory: dir.path);
  }

  @override
  Future<Breed?> getBreed(int breedId) => isar.breeds.get(breedId);

  @override
  Future<void> putBreeds(List<Breed> breeds) =>
      isar.writeTxn(() async => await isar.breeds.putAll(breeds));

  @override
  Future<List<Breed>> getFavorites() async {
    final favorites = await isar.favorites.filter().isFavoriteEqualTo(true).findAll();
    final ids = favorites.map((e) => e.id).toList();
    final breeds = await isar.breeds.getAll(ids);
    return breeds.whereType<Breed>().toList();
  }

  @override
  Future<void> setFavorite(int breedId, bool isFavorite) async {
    final favorite = Favorite()
      ..id = breedId
      ..isFavorite = isFavorite;
    return isar.writeTxn(() async => await isar.favorites.put(favorite));
  }

  @override
  Future<bool> isFavorite(int breedId) =>
      isar.favorites.get(breedId).then((f) => f?.isFavorite ?? false);

  @override
  Stream<List<Breed>> listenFavorites() => isar.favorites
      .filter()
      .isFavoriteEqualTo(true)
      .watch()
      .map((favorites) => favorites.map((favorite) => isar.breeds.getSync(favorite.id)!).toList());
}
