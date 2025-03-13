import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_database_model.g.dart';
part 'character_database_model.freezed.dart';

@freezed
abstract class CharacterDatabaseModel with _$CharacterDatabaseModel{
  const factory CharacterDatabaseModel({
    required final int id,
    final String? name,
    final bool? favorite,
    final String? status,
    final String? species,
    final String? type,
    final String? gender,
    final String? origin,
    final String? location,
    final String? image,
    final List<String>? episodes,
    final String? created,
    final String? updatedAt,
  }) = _CharacterDatabaseModel;

  factory CharacterDatabaseModel.fromJson(Map<String, Object?> json) => _$CharacterDatabaseModelFromJson(json);

  factory CharacterDatabaseModel.fromDatabaseMap(Map<String, dynamic> map) {
    return CharacterDatabaseModel(
      id: map['id'],
      name: map['name'],
      favorite: map['favorite'] != null ? (map['favorite'] == 1) : null,
      status: map['status'],
      species: map['species'],
      type: map['type'],
      gender: map['gender'],
      origin: map['origin'],
      location: map['location'],
      image: map['image'],
      episodes: map['episodes']?.toString().split(','),
      created: map['created'],
      updatedAt: map['updatedAt'],
    );
  }
}