import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_card_presentation_model.freezed.dart';
part 'character_card_presentation_model.g.dart';

@freezed
abstract class CharacterCardPresentationModel with _$CharacterCardPresentationModel{
  const factory CharacterCardPresentationModel({
    required final int id,
    final String? name,
    final bool? favorite,
    final String? image,
    final String? status,
    final String? species,
    final String? location,
  }) = _CharacterCardPresentationModel;

  factory CharacterCardPresentationModel.fromJson(Map<String, Object?> json) => _$CharacterCardPresentationModelFromJson(json);
}