import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_presentation_model.g.dart';
part 'character_presentation_model.freezed.dart';

@freezed
abstract class CharacterPresentationModel with _$CharacterPresentationModel{
  const factory CharacterPresentationModel({
    required final int id,
    required final String? name,
    required final String? image,
    required final String? status,
    required final String? species,
    required final String? location,
  }) = _CharacterPresentationModel;

  factory CharacterPresentationModel.fromJson(Map<String, Object?> json) => _$CharacterPresentationModel(json);
}