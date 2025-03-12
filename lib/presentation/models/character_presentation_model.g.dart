// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_presentation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterPresentationModel _$CharacterPresentationModelFromJson(
        Map<String, dynamic> json) =>
    _CharacterPresentationModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      favorite: json['favorite'] as bool?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$CharacterPresentationModelToJson(
        _CharacterPresentationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'favorite': instance.favorite,
      'image': instance.image,
      'status': instance.status,
      'species': instance.species,
      'location': instance.location,
    };
