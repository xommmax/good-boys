// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Breed _$$_BreedFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Breed',
      json,
      ($checkedConvert) {
        final val = _$_Breed(
          weight: $checkedConvert('weight', (v) => v as Map<String, dynamic>?),
          height: $checkedConvert('height', (v) => v as Map<String, dynamic>?),
          id: $checkedConvert('id', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          bredFor: $checkedConvert('bred_for', (v) => v as String?),
          breedGroup: $checkedConvert('breed_group', (v) => v as String?),
          lifeSpan: $checkedConvert('life_span', (v) => v as String?),
          temperament: $checkedConvert('temperament', (v) => v as String?),
          origin: $checkedConvert('origin', (v) => v as String?),
          referenceImageId:
              $checkedConvert('reference_image_id', (v) => v as String?),
          image: $checkedConvert('image', (v) => v as Map<String, dynamic>?),
        );
        return val;
      },
      fieldKeyMap: const {
        'bredFor': 'bred_for',
        'breedGroup': 'breed_group',
        'lifeSpan': 'life_span',
        'referenceImageId': 'reference_image_id'
      },
    );

Map<String, dynamic> _$$_BreedToJson(_$_Breed instance) => <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'id': instance.id,
      'name': instance.name,
      'bred_for': instance.bredFor,
      'breed_group': instance.breedGroup,
      'life_span': instance.lifeSpan,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'reference_image_id': instance.referenceImageId,
      'image': instance.image,
    };
