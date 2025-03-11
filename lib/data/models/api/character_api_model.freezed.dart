// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterApiModel {
  int get id;
  String? get name;
  String? get status;
  String? get species;
  String? get type;
  String? get gender;
  LocationApiModel? get origin;
  LocationApiModel? get location;
  String? get image;
  List<String>? get episodes;
  String? get created;

  /// Create a copy of CharacterApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CharacterApiModelCopyWith<CharacterApiModel> get copyWith =>
      _$CharacterApiModelCopyWithImpl<CharacterApiModel>(
          this as CharacterApiModel, _$identity);

  /// Serializes this CharacterApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharacterApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other.episodes, episodes) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      status,
      species,
      type,
      gender,
      origin,
      location,
      image,
      const DeepCollectionEquality().hash(episodes),
      created);

  @override
  String toString() {
    return 'CharacterApiModel(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episodes: $episodes, created: $created)';
  }
}

/// @nodoc
abstract mixin class $CharacterApiModelCopyWith<$Res> {
  factory $CharacterApiModelCopyWith(
          CharacterApiModel value, $Res Function(CharacterApiModel) _then) =
      _$CharacterApiModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? status,
      String? species,
      String? type,
      String? gender,
      LocationApiModel? origin,
      LocationApiModel? location,
      String? image,
      List<String>? episodes,
      String? created});

  $LocationApiModelCopyWith<$Res>? get origin;
  $LocationApiModelCopyWith<$Res>? get location;
}

/// @nodoc
class _$CharacterApiModelCopyWithImpl<$Res>
    implements $CharacterApiModelCopyWith<$Res> {
  _$CharacterApiModelCopyWithImpl(this._self, this._then);

  final CharacterApiModel _self;
  final $Res Function(CharacterApiModel) _then;

  /// Create a copy of CharacterApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
    Object? origin = freezed,
    Object? location = freezed,
    Object? image = freezed,
    Object? episodes = freezed,
    Object? created = freezed,
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
              as LocationApiModel?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationApiModel?,
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
    ));
  }

  /// Create a copy of CharacterApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationApiModelCopyWith<$Res>? get origin {
    if (_self.origin == null) {
      return null;
    }

    return $LocationApiModelCopyWith<$Res>(_self.origin!, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of CharacterApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationApiModelCopyWith<$Res>? get location {
    if (_self.location == null) {
      return null;
    }

    return $LocationApiModelCopyWith<$Res>(_self.location!, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _CharacterApiModel implements CharacterApiModel {
  const _CharacterApiModel(
      {required this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      final List<String>? episodes,
      this.created})
      : _episodes = episodes;
  factory _CharacterApiModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterApiModelFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? status;
  @override
  final String? species;
  @override
  final String? type;
  @override
  final String? gender;
  @override
  final LocationApiModel? origin;
  @override
  final LocationApiModel? location;
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

  /// Create a copy of CharacterApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CharacterApiModelCopyWith<_CharacterApiModel> get copyWith =>
      __$CharacterApiModelCopyWithImpl<_CharacterApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      status,
      species,
      type,
      gender,
      origin,
      location,
      image,
      const DeepCollectionEquality().hash(_episodes),
      created);

  @override
  String toString() {
    return 'CharacterApiModel(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episodes: $episodes, created: $created)';
  }
}

/// @nodoc
abstract mixin class _$CharacterApiModelCopyWith<$Res>
    implements $CharacterApiModelCopyWith<$Res> {
  factory _$CharacterApiModelCopyWith(
          _CharacterApiModel value, $Res Function(_CharacterApiModel) _then) =
      __$CharacterApiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? status,
      String? species,
      String? type,
      String? gender,
      LocationApiModel? origin,
      LocationApiModel? location,
      String? image,
      List<String>? episodes,
      String? created});

  @override
  $LocationApiModelCopyWith<$Res>? get origin;
  @override
  $LocationApiModelCopyWith<$Res>? get location;
}

/// @nodoc
class __$CharacterApiModelCopyWithImpl<$Res>
    implements _$CharacterApiModelCopyWith<$Res> {
  __$CharacterApiModelCopyWithImpl(this._self, this._then);

  final _CharacterApiModel _self;
  final $Res Function(_CharacterApiModel) _then;

  /// Create a copy of CharacterApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
    Object? origin = freezed,
    Object? location = freezed,
    Object? image = freezed,
    Object? episodes = freezed,
    Object? created = freezed,
  }) {
    return _then(_CharacterApiModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as LocationApiModel?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationApiModel?,
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
    ));
  }

  /// Create a copy of CharacterApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationApiModelCopyWith<$Res>? get origin {
    if (_self.origin == null) {
      return null;
    }

    return $LocationApiModelCopyWith<$Res>(_self.origin!, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of CharacterApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationApiModelCopyWith<$Res>? get location {
    if (_self.location == null) {
      return null;
    }

    return $LocationApiModelCopyWith<$Res>(_self.location!, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc
mixin _$LocationApiModel {
  int get id;
  String? get name;
  String? get type;
  String? get dimension;
  List<String>? get residents;
  String? get url;
  String get created;

  /// Create a copy of LocationApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationApiModelCopyWith<LocationApiModel> get copyWith =>
      _$LocationApiModelCopyWithImpl<LocationApiModel>(
          this as LocationApiModel, _$identity);

  /// Serializes this LocationApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dimension, dimension) ||
                other.dimension == dimension) &&
            const DeepCollectionEquality().equals(other.residents, residents) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, dimension,
      const DeepCollectionEquality().hash(residents), url, created);

  @override
  String toString() {
    return 'LocationApiModel(id: $id, name: $name, type: $type, dimension: $dimension, residents: $residents, url: $url, created: $created)';
  }
}

/// @nodoc
abstract mixin class $LocationApiModelCopyWith<$Res> {
  factory $LocationApiModelCopyWith(
          LocationApiModel value, $Res Function(LocationApiModel) _then) =
      _$LocationApiModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? type,
      String? dimension,
      List<String>? residents,
      String? url,
      String created});
}

/// @nodoc
class _$LocationApiModelCopyWithImpl<$Res>
    implements $LocationApiModelCopyWith<$Res> {
  _$LocationApiModelCopyWithImpl(this._self, this._then);

  final LocationApiModel _self;
  final $Res Function(LocationApiModel) _then;

  /// Create a copy of LocationApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? type = freezed,
    Object? dimension = freezed,
    Object? residents = freezed,
    Object? url = freezed,
    Object? created = null,
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
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      dimension: freezed == dimension
          ? _self.dimension
          : dimension // ignore: cast_nullable_to_non_nullable
              as String?,
      residents: freezed == residents
          ? _self.residents
          : residents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LocationApiModel implements LocationApiModel {
  _LocationApiModel(
      {required this.id,
      required this.name,
      required this.type,
      required this.dimension,
      required final List<String>? residents,
      required this.url,
      required this.created})
      : _residents = residents;
  factory _LocationApiModel.fromJson(Map<String, dynamic> json) =>
      _$LocationApiModelFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? dimension;
  final List<String>? _residents;
  @override
  List<String>? get residents {
    final value = _residents;
    if (value == null) return null;
    if (_residents is EqualUnmodifiableListView) return _residents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? url;
  @override
  final String created;

  /// Create a copy of LocationApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationApiModelCopyWith<_LocationApiModel> get copyWith =>
      __$LocationApiModelCopyWithImpl<_LocationApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dimension, dimension) ||
                other.dimension == dimension) &&
            const DeepCollectionEquality()
                .equals(other._residents, _residents) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, dimension,
      const DeepCollectionEquality().hash(_residents), url, created);

  @override
  String toString() {
    return 'LocationApiModel(id: $id, name: $name, type: $type, dimension: $dimension, residents: $residents, url: $url, created: $created)';
  }
}

/// @nodoc
abstract mixin class _$LocationApiModelCopyWith<$Res>
    implements $LocationApiModelCopyWith<$Res> {
  factory _$LocationApiModelCopyWith(
          _LocationApiModel value, $Res Function(_LocationApiModel) _then) =
      __$LocationApiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? type,
      String? dimension,
      List<String>? residents,
      String? url,
      String created});
}

/// @nodoc
class __$LocationApiModelCopyWithImpl<$Res>
    implements _$LocationApiModelCopyWith<$Res> {
  __$LocationApiModelCopyWithImpl(this._self, this._then);

  final _LocationApiModel _self;
  final $Res Function(_LocationApiModel) _then;

  /// Create a copy of LocationApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? type = freezed,
    Object? dimension = freezed,
    Object? residents = freezed,
    Object? url = freezed,
    Object? created = null,
  }) {
    return _then(_LocationApiModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      dimension: freezed == dimension
          ? _self.dimension
          : dimension // ignore: cast_nullable_to_non_nullable
              as String?,
      residents: freezed == residents
          ? _self._residents
          : residents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
