import 'models/breed/breed.dart';

abstract class LocalStorage {
  Future<Breed?> getBreed(int breedId);

  Future<void> putBreeds(List<Breed> breeds);

  Future<void> setFavorite(int breedId, bool isFavorite);

  Future<List<Breed>> getFavorites();

  Stream<List<Breed>> listenFavorites();
}
