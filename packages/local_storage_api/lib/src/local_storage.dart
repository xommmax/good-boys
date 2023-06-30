import 'models/breed/breed.dart';

abstract class LocalStorage {
  Future<Breed?> getBreed(int breedId);

  Future<void> putBreeds(List<Breed> breeds);

  Future<void> setFavorite(int breedId, bool isFavorite);

  Future<bool> isFavorite(int breedId);

  Future<List<Breed>> getFavorites();

  Stream<List<Breed>> listenFavorites();
}
