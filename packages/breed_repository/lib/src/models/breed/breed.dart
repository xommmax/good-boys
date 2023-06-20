// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dog_api/dog_api.dart' as dog_api;
import 'package:local_storage_api/local_storage_api.dart' as local_storage;

part 'breed.freezed.dart';
part 'breed.g.dart';

@freezed
class Breed with _$Breed {
  const Breed._();

  const factory Breed({
    required int id,
    required String? weight,
    required String? height,
    required String name,
    required String? bredFor,
    required String? breedGroup,
    required String? lifeSpan,
    required String? temperament,
    required String? origin,
    required String imageUrl,
    required bool isFavorite,
  }) = _Breed;

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  factory Breed.fromApi(dog_api.Breed breed) => Breed(
        id: breed.id,
        weight: breed.weight?['metric'],
        height: breed.height?['metric'],
        name: breed.name,
        bredFor: breed.bredFor,
        breedGroup: breed.breedGroup,
        lifeSpan: breed.lifeSpan,
        temperament: breed.temperament,
        origin: breed.origin,
        imageUrl: breed.image['url'],
        isFavorite: false,
      );

  factory Breed.fromDb(local_storage.Breed breed) => Breed(
        id: breed.id,
        weight: breed.weight,
        height: breed.height,
        name: breed.name,
        bredFor: breed.bredFor,
        breedGroup: breed.breedGroup,
        lifeSpan: breed.lifeSpan,
        temperament: breed.temperament,
        origin: breed.origin,
        imageUrl: breed.imageUrl,
        isFavorite: breed.isFavorite,
      );

  local_storage.Breed toDb() {
    var breed = local_storage.Breed();
    breed.id = id;
    breed.weight = weight;
    breed.height = height;
    breed.name = name;
    breed.bredFor = bredFor;
    breed.breedGroup = breedGroup;
    breed.lifeSpan = lifeSpan;
    breed.temperament = temperament;
    breed.origin = origin;
    breed.imageUrl = imageUrl;
    breed.isFavorite = isFavorite;
    return breed;
  }
}
