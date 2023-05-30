import 'package:breed_repository/breed_repository.dart';
import 'package:dog_api/dog_api.dart' hide Breed;

class BreedRepository {
  BreedRepository({DogApiClient? dogApiClient}) : _dogApiClient = dogApiClient ?? DogApiClient();

  final DogApiClient _dogApiClient;

  Future<List<Breed>> getBreeds({int page = 0, int limit = 10}) async {
    final breeds = await _dogApiClient.getBreeds(page: page, limit: limit);
    return breeds
        .map((e) => Breed(
              weight: e.weight?['metric'],
              height: e.height?['metric'],
              id: e.id,
              name: e.name,
              bredFor: e.bredFor,
              breedGroup: e.breedGroup,
              lifeSpan: e.lifeSpan,
              temperament: e.temperament,
              origin: e.origin,
              imageUrl: e.image?['url'],
            ))
        .toList();
  }
}
