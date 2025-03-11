import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_presentation_model.g.dart';
part 'character_presentation_model.freezed.dart';

@freezed
abstract class CharacterPresentationModel with _$CharacterPresentationModel{
  const factory CharacterPresentationModel({
    required final int id,
    final String? name,
    required bool? favorite,
    final String? image,
    final String? status,
    final String? species,
    final String? location,
  }) = _CharacterPresentationModel;

  factory CharacterPresentationModel.fromJson(Map<String, Object?> json) => _$CharacterPresentationModel(json);
}