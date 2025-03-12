import '../models/database/character_database_model.dart';

extension CharacterDatabaseModelFactory on CharacterDatabaseModel {
  static CharacterDatabaseModel fromDatabaseMap(Map<String, dynamic> map) {
    return CharacterDatabaseModel(
      id: map['id'],
      name: map['name'],
      favorite: map['favorite'] != null ? (map['favorite'] == 1) : null,
      status: map['status'],
      species: map['species'],
      type: map['type'],
      gender: map['gender'],
      origin: map['origin'],
      location: map['location'],
      image: map['image'],
      episodes: map['episodes']?.toString().split(','),
      created: map['created'],
      updatedAt: map['updatedAt'],
    );
  }
}

extension CharacterDatabaseModelExtensions on CharacterDatabaseModel {
  Map<String, dynamic> toDatabaseMap() {
    return {
      'id': id,
      'name': name,
      'favorite': favorite != null ? (favorite! ? 1 : 0) : null,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin,
      'location': location,
      'image': image,
      'episodes': episodes?.join(','),
      'created': created,
      'updatedAt': updatedAt,
    };
  }
}