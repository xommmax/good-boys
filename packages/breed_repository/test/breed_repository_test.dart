import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

import 'package:breed_repository/breed_repository.dart';

import 'package:mocktail/mocktail.dart';
import 'package:dog_api/dog_api.dart' as dog_api;

class MockDogApiClient extends Mock implements dog_api.DogApiClient {}

class MockBreed extends Mock implements dog_api.Breed {}

void main() {
  group('WeatherRepository', () {
    late dog_api.DogApiClient dogApiClient;
    late BreedRepository breedRepository;
    final random = Random();

    setUp(() {
      dogApiClient = MockDogApiClient();
      breedRepository = BreedRepository(
        dogApiClient: dogApiClient,
      );
    });

    group('constructor', () {
      test('instantiates internal dog api client when not injected', () {
        expect(BreedRepository(), isNotNull);
      });
    });

    group('getBreeds', () {
      final page = random.nextInt(100);
      final limit = random.nextInt(100);

      test('calls dio client with correct args', () async {
        try {
          await breedRepository.getBreeds(page: page, limit: limit);
        } catch (_) {}
        verify(() => dogApiClient.getBreeds(page: page, limit: limit)).called(1);
      });

      test('throws when dio call fails', () async {
        final exception = Exception('oops');
        when(() => dogApiClient.getBreeds(page: any(named: 'page'), limit: any(named: 'limit'))).thenThrow(exception);
        expect(
          () async => breedRepository.getBreeds(page: page, limit: limit),
          throwsA(exception),
        );
      });

      test('returns correct weather on success (clear)', () async {
        final breed = MockBreed();
        when(() => breed.weight).thenReturn({"imperial": "6 - 13", "metric": "3 - 6"});
        when(() => breed.name).thenReturn('Affenpinscher');
        when(() => breed.image).thenReturn({
          "id": "BJa4kxc4X",
          "width": 1600,
          "height": 1199,
          "url": "https://cdn2.thedogapi.com/images/BJa4kxc4X.jpg"
        });
        when(() => dogApiClient.getBreeds(page: any(named: 'page'), limit: any(named: 'limit'))).thenAnswer(
          (_) async => [breed],
        );

        final actual = await breedRepository.getBreeds(page: page, limit: limit);
        expect(
            actual[0],
            isA<Breed>()
                .having((b) => b.weight, 'weight', '3 - 6')
                .having((b) => b.name, 'name', 'Affenpinscher')
                .having((b) => b.imageUrl, 'imageUrl', 'https://cdn2.thedogapi.com/images/BJa4kxc4X.jpg'));
      });
    });
  });
}
