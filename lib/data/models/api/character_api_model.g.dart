// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterApiModel _$CharacterApiModelFromJson(Map<String, dynamic> json) =>
    _CharacterApiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
      origin: json['origin'] == null
          ? null
          : LocationApiModel.fromJson(json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : LocationApiModel.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      created: json['created'] as String?,
    );

Map<String, dynamic> _$CharacterApiModelToJson(_CharacterApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
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

_LocationApiModel _$LocationApiModelFromJson(Map<String, dynamic> json) =>
    _LocationApiModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LocationApiModelToJson(_LocationApiModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
