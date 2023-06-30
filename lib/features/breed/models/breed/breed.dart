// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:breed_repository/breed_repository.dart' as breed_repository;

part 'breed.freezed.dart';
part 'breed.g.dart';

@freezed
class Breed with _$Breed {
  const factory Breed({
    required int id,
    required String name,
    required String imageUrl,
    required String? weight,
    required String? height,
    required String? bredFor,
    required String? breedGroup,
    required String? lifeSpan,
    required String? temperament,
    required String? origin,
  }) = _Breed;

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  factory Breed.fromRepo(breed_repository.Breed breed) => Breed(
        id: breed.id,
        name: breed.name,
        weight: breed.weight,
        height: breed.height,
        bredFor: breed.bredFor,
        breedGroup: breed.breedGroup,
        lifeSpan: breed.lifeSpan,
        temperament: breed.temperament,
        origin: breed.origin,
        imageUrl: breed.imageUrl,
      );
}
