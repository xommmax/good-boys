import 'package:isar/isar.dart';
import 'package:local_storage_api/local_storage_api.dart';
import 'package:path_provider/path_provider.dart';

class IsarLocalStorage implements LocalStorage {
  IsarLocalStorage() {
    _init();
  }

  late final Isar isar;

  Future<void> _init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([BreedSchema], directory: dir.path);
  }

  @override
  Future<Breed?> getBreed(int breedId) => isar.breeds.get(breedId);

  @override
  Future<List<Breed>> getFavorites() => isar.breeds.filter().isFavoriteEqualTo(true).findAll();

  @override
  Future<void> putBreeds(List<Breed> breeds) =>
      isar.writeTxn(() async => await isar.breeds.putAll(breeds));

  @override
  Future<void> setFavorite(int breedId, bool isFavorite) async {
    final breed = await isar.breeds.get(breedId);
    if (breed != null) {
      breed.isFavorite = isFavorite;
      await isar.writeTxn(() async => await isar.breeds.put(breed));
    }
  }

  @override
  Stream<List<Breed>> listenFavorites() => isar.breeds.filter().isFavoriteEqualTo(true).watch();
}
