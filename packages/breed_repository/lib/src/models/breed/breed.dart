// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dog_api/dog_api.dart' as dog_api;

part 'breed.freezed.dart';
part 'breed.g.dart';

@freezed
class Breed with _$Breed {
  const factory Breed({
    required String? weight,
    required String? height,
    required int id,
    required String name,
    required String? bredFor,
    required String? breedGroup,
    required String? lifeSpan,
    required String? temperament,
    required String? origin,
    required String imageUrl,
  }) = _Breed;

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  factory Breed.fromApi(dog_api.Breed breed) => Breed(
        weight: breed.weight?['metric'],
        height: breed.height?['metric'],
        id: breed.id,
        name: breed.name,
        bredFor: breed.bredFor,
        breedGroup: breed.breedGroup,
        lifeSpan: breed.lifeSpan,
        temperament: breed.temperament,
        origin: breed.origin,
        imageUrl: breed.image['url'],
      );
}
