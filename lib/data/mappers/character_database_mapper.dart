import '../models/database/character_database_model.dart';

extension CharacterDatabaseModelFactory on CharacterDatabaseModel {

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