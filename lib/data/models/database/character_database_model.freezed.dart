// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_database_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterDatabaseModel {
  int get id;
  String? get name;
  bool? get favorite;
  String? get status;
  String? get species;
  String? get type;
  String? get gender;
  String? get origin;
  String? get location;
  String? get image;
  List<String>? get episodes;
  String? get created;
  String? get updatedAt;

  /// Create a copy of CharacterDatabaseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CharacterDatabaseModelCopyWith<CharacterDatabaseModel> get copyWith =>
      _$CharacterDatabaseModelCopyWithImpl<CharacterDatabaseModel>(
          this as CharacterDatabaseModel, _$identity);

  /// Serializes this CharacterDatabaseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharacterDatabaseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other.episodes, episodes) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      favorite,
      status,
      species,
      type,
      gender,
      origin,
      location,
      image,
      const DeepCollectionEquality().hash(episodes),
      created,
      updatedAt);

  @override
  String toString() {
    return 'CharacterDatabaseModel(id: $id, name: $name, favorite: $favorite, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episodes: $episodes, created: $created, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CharacterDatabaseModelCopyWith<$Res> {
  factory $CharacterDatabaseModelCopyWith(CharacterDatabaseModel value,
          $Res Function(CharacterDatabaseModel) _then) =
      _$CharacterDatabaseModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? name,
      bool? favorite,
      String? status,
      String? species,
      String? type,
      String? gender,
      String? origin,
      String? location,
      String? image,
      List<String>? episodes,
      String? created,
      String? updatedAt});
}

/// @nodoc
class _$CharacterDatabaseModelCopyWithImpl<$Res>
    implements $CharacterDatabaseModelCopyWith<$Res> {
  _$CharacterDatabaseModelCopyWithImpl(this._self, this._then);

  final CharacterDatabaseModel _self;
  final $Res Function(CharacterDatabaseModel) _then;

  /// Create a copy of CharacterDatabaseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? favorite = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
    Object? origin = freezed,
    Object? location = freezed,
    Object? image = freezed,
    Object? episodes = freezed,
    Object? created = freezed,
    Object? updatedAt = freezed,
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
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      species: freezed == species
          ? _self.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      episodes: freezed == episodes
          ? _self.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      created: freezed == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CharacterDatabaseModel implements CharacterDatabaseModel {
  const _CharacterDatabaseModel(
      {required this.id,
      this.name,
      this.favorite,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      final List<String>? episodes,
      this.created,
      this.updatedAt})
      : _episodes = episodes;
  factory _CharacterDatabaseModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterDatabaseModelFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final bool? favorite;
  @override
  final String? status;
  @override
  final String? species;
  @override
  final String? type;
  @override
  final String? gender;
  @override
  final String? origin;
  @override
  final String? location;
  @override
  final String? image;
  final List<String>? _episodes;
  @override
  List<String>? get episodes {
    final value = _episodes;
    if (value == null) return null;
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? created;
  @override
  final String? updatedAt;

  /// Create a copy of CharacterDatabaseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CharacterDatabaseModelCopyWith<_CharacterDatabaseModel> get copyWith =>
      __$CharacterDatabaseModelCopyWithImpl<_CharacterDatabaseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterDatabaseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterDatabaseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      favorite,
      status,
      species,
      type,
      gender,
      origin,
      location,
      image,
      const DeepCollectionEquality().hash(_episodes),
      created,
      updatedAt);

  @override
  String toString() {
    return 'CharacterDatabaseModel(id: $id, name: $name, favorite: $favorite, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episodes: $episodes, created: $created, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$CharacterDatabaseModelCopyWith<$Res>
    implements $CharacterDatabaseModelCopyWith<$Res> {
  factory _$CharacterDatabaseModelCopyWith(_CharacterDatabaseModel value,
          $Res Function(_CharacterDatabaseModel) _then) =
      __$CharacterDatabaseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      bool? favorite,
      String? status,
      String? species,
      String? type,
      String? gender,
      String? origin,
      String? location,
      String? image,
      List<String>? episodes,
      String? created,
      String? updatedAt});
}

/// @nodoc
class __$CharacterDatabaseModelCopyWithImpl<$Res>
    implements _$CharacterDatabaseModelCopyWith<$Res> {
  __$CharacterDatabaseModelCopyWithImpl(this._self, this._then);

  final _CharacterDatabaseModel _self;
  final $Res Function(_CharacterDatabaseModel) _then;

  /// Create a copy of CharacterDatabaseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? favorite = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
    Object? origin = freezed,
    Object? location = freezed,
    Object? image = freezed,
    Object? episodes = freezed,
    Object? created = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_CharacterDatabaseModel(
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
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      species: freezed == species
          ? _self.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      episodes: freezed == episodes
          ? _self._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      created: freezed == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
