import 'dart:ffi';

import 'package:rick_demo_project/data/models/database/character_database_model.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';

extension DomainToDatabaseMapper on CharacterModel{
  CharacterDatabaseModel toDatabaseModel(){
    return CharacterDatabaseModel(
      id: id,
      favorite: favorite,
      status: status,
      species: species,
      type : type,
      gender: gender,
      origin: origin,
      location: location,
      image: image,
      episodes: episodes,
      created: created,
      updatedAt: DateTime.now().toUtc().toIso8601String(),
    );
  }
}

extension DatabaseToDomainMapper on CharacterDatabaseModel{
  CharacterModel toModel(){
    return CharacterModel(
      id: id,
      favorite: favorite,
      status: status,
      species: species,
      type : type,
      gender: gender,
      origin: origin,
      location: location,
      image: image,
      episodes: episodes,
      created: created,
    );
  }
}