import 'dart:math';

import 'package:dog_api/dog_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Breed', () {
    final random = Random();

    group('fromJson', () {
      test('returns correct Breed object', () {
        final weight = <String, dynamic>{};
        final height = <String, dynamic>{};
        final id = random.nextInt(100);
        const name = 'mock name';
        const bredFor = 'mock bredFor';
        const breedGroup = 'mock breedGroup';
        const lifeSpan = 'mock lifeSpan';
        const temperament = 'mock temperament';
        const origin = 'mock origin';
        const referenceImageId = 'mock referenceImageId';
        const image = <String, dynamic>{};
        expect(
          Breed.fromJson(
            <String, dynamic>{
              'weight': weight,
              'height': height,
              'id': id,
              'name': name,
              'bred_for': bredFor,
              'breed_group': breedGroup,
              'life_span': lifeSpan,
              'temperament': temperament,
              'origin': origin,
              'reference_image_id': referenceImageId,
              'image': image,
            },
          ),
          isA<Breed>()
              .having((b) => b.weight, 'weight', weight)
              .having((b) => b.height, 'height', height)
              .having((b) => b.id, 'id', id)
              .having((b) => b.name, 'name', name)
              .having((b) => b.bredFor, 'bredFor', bredFor)
              .having((b) => b.breedGroup, 'breedGroup', breedGroup)
              .having((b) => b.lifeSpan, 'lifeSpan', lifeSpan)
              .having((b) => b.temperament, 'temperament', temperament)
              .having((b) => b.origin, 'origin', origin)
              .having((b) => b.referenceImageId, 'referenceImageId', referenceImageId)
              .having((b) => b.image, 'image', image),
        );
      });
    });
  });
}
