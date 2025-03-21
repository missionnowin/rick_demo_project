// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_card_presentation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterCardPresentationModel {
  int get id;
  String? get name;
  bool? get favorite;
  String? get image;
  String? get status;
  String? get species;
  String? get location;

  /// Create a copy of CharacterCardPresentationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CharacterCardPresentationModelCopyWith<CharacterCardPresentationModel>
      get copyWith => _$CharacterCardPresentationModelCopyWithImpl<
              CharacterCardPresentationModel>(
          this as CharacterCardPresentationModel, _$identity);

  /// Serializes this CharacterCardPresentationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharacterCardPresentationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, favorite, image, status, species, location);

  @override
  String toString() {
    return 'CharacterCardPresentationModel(id: $id, name: $name, favorite: $favorite, image: $image, status: $status, species: $species, location: $location)';
  }
}

/// @nodoc
abstract mixin class $CharacterCardPresentationModelCopyWith<$Res> {
  factory $CharacterCardPresentationModelCopyWith(
          CharacterCardPresentationModel value,
          $Res Function(CharacterCardPresentationModel) _then) =
      _$CharacterCardPresentationModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? name,
      bool? favorite,
      String? image,
      String? status,
      String? species,
      String? location});
}

/// @nodoc
class _$CharacterCardPresentationModelCopyWithImpl<$Res>
    implements $CharacterCardPresentationModelCopyWith<$Res> {
  _$CharacterCardPresentationModelCopyWithImpl(this._self, this._then);

  final CharacterCardPresentationModel _self;
  final $Res Function(CharacterCardPresentationModel) _then;

  /// Create a copy of CharacterCardPresentationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? favorite = freezed,
    Object? image = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? location = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      favorite: freezed == favorite
          ? _self.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      species: freezed == species
          ? _self.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CharacterCardPresentationModel
    implements CharacterCardPresentationModel {
  const _CharacterCardPresentationModel(
      {required this.id,
      this.name,
      this.favorite,
      this.image,
      this.status,
      this.species,
      this.location});
  factory _CharacterCardPresentationModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterCardPresentationModelFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final bool? favorite;
  @override
  final String? image;
  @override
  final String? status;
  @override
  final String? species;
  @override
  final String? location;

  /// Create a copy of CharacterCardPresentationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CharacterCardPresentationModelCopyWith<_CharacterCardPresentationModel>
      get copyWith => __$CharacterCardPresentationModelCopyWithImpl<
          _CharacterCardPresentationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterCardPresentationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterCardPresentationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, favorite, image, status, species, location);

  @override
  String toString() {
    return 'CharacterCardPresentationModel(id: $id, name: $name, favorite: $favorite, image: $image, status: $status, species: $species, location: $location)';
  }
}

/// @nodoc
abstract mixin class _$CharacterCardPresentationModelCopyWith<$Res>
    implements $CharacterCardPresentationModelCopyWith<$Res> {
  factory _$CharacterCardPresentationModelCopyWith(
          _CharacterCardPresentationModel value,
          $Res Function(_CharacterCardPresentationModel) _then) =
      __$CharacterCardPresentationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      bool? favorite,
      String? image,
      String? status,
      String? species,
      String? location});
}

/// @nodoc
class __$CharacterCardPresentationModelCopyWithImpl<$Res>
    implements _$CharacterCardPresentationModelCopyWith<$Res> {
  __$CharacterCardPresentationModelCopyWithImpl(this._self, this._then);

  final _CharacterCardPresentationModel _self;
  final $Res Function(_CharacterCardPresentationModel) _then;

  /// Create a copy of CharacterCardPresentationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? favorite = freezed,
    Object? image = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? location = freezed,
  }) {
    return _then(_CharacterCardPresentationModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      favorite: freezed == favorite
          ? _self.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      species: freezed == species
          ? _self.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
