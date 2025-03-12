// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_domain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    _CharacterModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      favorite: json['favorite'] as bool?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
      origin: json['origin'] as String?,
      location: json['location'] as String?,
      image: json['image'] as String?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      created: json['created'] as String?,
    );

Map<String, dynamic> _$CharacterModelToJson(_CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'favorite': instance.favorite,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episodes': instance.episodes,
      'created': instance.created,
    };
