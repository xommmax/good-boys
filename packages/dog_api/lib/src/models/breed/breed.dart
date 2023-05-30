// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed.freezed.dart';
part 'breed.g.dart';

@freezed
class Breed with _$Breed {
  const factory Breed({
    required Map? weight,
    required Map? height,
    required int? id,
    required String? name,
    required String? bredFor,
    required String? breedGroup,
    required String? lifeSpan,
    required String? temperament,
    required String? origin,
    required String? referenceImageId,
    required Map? image,
  }) = _Breed;

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);
}
