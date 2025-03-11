import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_database_model.g.dart';
part 'character_database_model.freezed.dart';

@freezed
abstract class CharacterDatabaseModel with _$CharacterDatabaseModel{
  const factory CharacterDatabaseModel({
    required final int id,
    final String? name,
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
}