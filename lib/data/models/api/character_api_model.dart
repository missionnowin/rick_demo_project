import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_api_model.freezed.dart';
part 'character_api_model.g.dart';

@freezed
abstract class CharacterApiModel with _$CharacterApiModel{
  const factory CharacterApiModel({
    required final int id,
    final String? name,
    final String? status,
    final String? species,
    final String? type,
    final String? gender,
    final LocationApiModel? origin,
    final LocationApiModel? location,
    final String? image,
    final List<String>? episodes,
    final String? created,
}) = _CharacterApiModel;

  factory CharacterApiModel.fromJson(Map<String, Object?> json) => _$CharacterApiModelFromJson(json);
}

@freezed
abstract class LocationApiModel with _$LocationApiModel{
  factory LocationApiModel({
    required final String? name,
    required final String? url,
  }) = _LocationApiModel;

  factory LocationApiModel.fromJson(Map<String, dynamic> json) => _$LocationApiModelFromJson(json);
}