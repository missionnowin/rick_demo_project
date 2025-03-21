// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_card_presentation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterCardPresentationModel _$CharacterCardPresentationModelFromJson(
        Map<String, dynamic> json) =>
    _CharacterCardPresentationModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      favorite: json['favorite'] as bool?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$CharacterCardPresentationModelToJson(
        _CharacterCardPresentationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'favorite': instance.favorite,
      'image': instance.image,
      'status': instance.status,
      'species': instance.species,
      'location': instance.location,
    };
