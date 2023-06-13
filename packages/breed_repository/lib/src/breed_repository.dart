import 'package:breed_repository/breed_repository.dart';
import 'package:dog_api/dog_api.dart' hide Breed;

class BreedRepository {
  BreedRepository({DogApiClient? dogApiClient}) : _dogApiClient = dogApiClient ?? DogApiClient();

  final DogApiClient _dogApiClient;

  Future<List<Breed>> getBreeds({int page = 0, int limit = 10}) async =>
      (await _dogApiClient.getBreeds(page: page, limit: limit))
          .map((b) => Breed.fromApi(b))
          .toList();

  Future<List<String>> getBreedImages(int breedId) async =>
      (await _dogApiClient.getBreedImages(breedId))
          .map((url) => url.replaceAll('_1280', ''))
          .toList();
}
