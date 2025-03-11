// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_database_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterDatabaseModel _$CharacterDatabaseModelFromJson(
        Map<String, dynamic> json) =>
    _CharacterDatabaseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
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
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CharacterDatabaseModelToJson(
        _CharacterDatabaseModel instance) =>
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
      'updatedAt': instance.updatedAt,
    };
