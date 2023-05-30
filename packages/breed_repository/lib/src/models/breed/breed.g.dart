// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Breed _$$_BreedFromJson(Map<String, dynamic> json) => _$_Breed(
      weight: json['weight'] as String?,
      height: json['height'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      bredFor: json['bredFor'] as String?,
      breedGroup: json['breedGroup'] as String?,
      lifeSpan: json['lifeSpan'] as String?,
      temperament: json['temperament'] as String?,
      origin: json['origin'] as String?,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$_BreedToJson(_$_Breed instance) => <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'id': instance.id,
      'name': instance.name,
      'bredFor': instance.bredFor,
      'breedGroup': instance.breedGroup,
      'lifeSpan': instance.lifeSpan,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'imageUrl': instance.imageUrl,
    };
