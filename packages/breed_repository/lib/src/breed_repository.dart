import 'package:breed_repository/breed_repository.dart';
import 'package:dog_api/dog_api.dart' show DogApiClient;
import 'package:local_storage_api/local_storage_api.dart' show LocalStorage, IsarLocalStorage;

class BreedRepository {
  BreedRepository({DogApiClient? dogApiClient, LocalStorage? localStorage})
      : _dogApiClient = dogApiClient ?? DogApiClient(),
        _localStorage = localStorage ?? IsarLocalStorage();

  final DogApiClient _dogApiClient;
  final LocalStorage _localStorage;

  Future<List<Breed>> getBreeds({int page = 0, int limit = 20}) async {
    final apiBreeds = await _dogApiClient.getBreeds(page: page, limit: limit);
    final domainBreeds = apiBreeds.map((b) => Breed.fromApi(b)).toList();
    final dbBreeds = domainBreeds.map((b) => b.toDb()).toList();

    _localStorage.putBreeds(dbBreeds);
    return domainBreeds;
  }

  Future<List<String>> getBreedImages(int breedId) async =>
      (await _dogApiClient.getBreedImages(breedId))
          .map((url) => url.replaceAll('_1280', ''))
          .toList();

  Future<bool> isFavorite(int breedId) async {
    final breed = await _localStorage.getBreed(breedId);
    return breed?.isFavorite ?? false;
  }

  Future<void> setFavorite(int breedId, bool isFavorite) =>
      _localStorage.setFavorite(breedId, isFavorite);

  Future<List<Breed>> getFavorites() async {
    final breeds = await _localStorage.getFavorites();
    return breeds.map((e) => Breed.fromDb(e)).toList();
  }

  Stream<List<Breed>> listenFavorites() =>
      _localStorage.listenFavorites().map((list) => list.map((e) => Breed.fromDb(e)).toList());

  Future<List<Breed>> search(String query) async {
    final apiBreeds = await _dogApiClient.search(query);
    final domainBreeds = apiBreeds.map((b) => Breed.fromApi(b)).toList();
    final dbBreeds = domainBreeds.map((b) => b.toDb()).toList();

    _localStorage.putBreeds(dbBreeds);
    return domainBreeds;
  }
}
