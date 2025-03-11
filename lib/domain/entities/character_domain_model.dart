import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_domain_model.freezed.dart';
part 'character_domain_model.g.dart';

@freezed
abstract class CharacterModel with _$CharacterModel{
  const factory CharacterModel({
    required final int id,
    final String? name,
    bool? favorite,
    final String? status,
    final String? species,
    final String? type,
    final String? gender,
    final String? origin,
    final String? location,
    final String? image,
    final List<String>? episodes,
    final String? created,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, Object?> json) => _$CharacterModelFromJson(json);
}