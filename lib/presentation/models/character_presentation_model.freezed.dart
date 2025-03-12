// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_presentation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterPresentationModel {
  int get id;
  String? get name;
  bool? get favorite;
  String? get image;
  String? get status;
  String? get species;
  String? get location;

  /// Create a copy of CharacterPresentationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CharacterPresentationModelCopyWith<CharacterPresentationModel>
      get copyWith =>
          _$CharacterPresentationModelCopyWithImpl<CharacterPresentationModel>(
              this as CharacterPresentationModel, _$identity);

  /// Serializes this CharacterPresentationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharacterPresentationModel &&
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
    return 'CharacterPresentationModel(id: $id, name: $name, favorite: $favorite, image: $image, status: $status, species: $species, location: $location)';
  }
}

/// @nodoc
abstract mixin class $CharacterPresentationModelCopyWith<$Res> {
  factory $CharacterPresentationModelCopyWith(CharacterPresentationModel value,
          $Res Function(CharacterPresentationModel) _then) =
      _$CharacterPresentationModelCopyWithImpl;
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
class _$CharacterPresentationModelCopyWithImpl<$Res>
    implements $CharacterPresentationModelCopyWith<$Res> {
  _$CharacterPresentationModelCopyWithImpl(this._self, this._then);

  final CharacterPresentationModel _self;
  final $Res Function(CharacterPresentationModel) _then;

  /// Create a copy of CharacterPresentationModel
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
class _CharacterPresentationModel implements CharacterPresentationModel {
  const _CharacterPresentationModel(
      {required this.id,
      this.name,
      this.favorite,
      this.image,
      this.status,
      this.species,
      this.location});
  factory _CharacterPresentationModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterPresentationModelFromJson(json);

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

  /// Create a copy of CharacterPresentationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CharacterPresentationModelCopyWith<_CharacterPresentationModel>
      get copyWith => __$CharacterPresentationModelCopyWithImpl<
          _CharacterPresentationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterPresentationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterPresentationModel &&
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
    return 'CharacterPresentationModel(id: $id, name: $name, favorite: $favorite, image: $image, status: $status, species: $species, location: $location)';
  }
}

/// @nodoc
abstract mixin class _$CharacterPresentationModelCopyWith<$Res>
    implements $CharacterPresentationModelCopyWith<$Res> {
  factory _$CharacterPresentationModelCopyWith(
          _CharacterPresentationModel value,
          $Res Function(_CharacterPresentationModel) _then) =
      __$CharacterPresentationModelCopyWithImpl;
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
class __$CharacterPresentationModelCopyWithImpl<$Res>
    implements _$CharacterPresentationModelCopyWith<$Res> {
  __$CharacterPresentationModelCopyWithImpl(this._self, this._then);

  final _CharacterPresentationModel _self;
  final $Res Function(_CharacterPresentationModel) _then;

  /// Create a copy of CharacterPresentationModel
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
    return _then(_CharacterPresentationModel(
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
