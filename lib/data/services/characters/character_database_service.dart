import 'package:rick_demo_project/data/data_sources/database_client.dart';
import 'package:rick_demo_project/data/mappers/character_database_mapper.dart';
import 'package:rick_demo_project/data/models/database/character_database_model.dart';

abstract class CharacterDatabaseService {
  ///Save character if one not in local database, update otherwise
  Future<void> saveCharacter(CharacterDatabaseModel character);
  ///Trying to remove character by id from database
  Future<void> removeCharacter(CharacterDatabaseModel character);
  ///Trying to get character from local database by id. If character found return CharacterDatabaseModel, Null otherwise
  Future<CharacterDatabaseModel?> getCharacterById(int id);
  ///Return List of all characters in database with pagination. Default - page = 1, limit = 20
  Future<List<CharacterDatabaseModel>> getCharacters({int page = 1, int limit = 20});
}

class DatabaseServiceImpl implements CharacterDatabaseService {
  final DatabaseClient _databaseClient;

  DatabaseServiceImpl(this._databaseClient);

  @override
  Future<void> saveCharacter(CharacterDatabaseModel character) async {
    final db = _databaseClient.database;
    final query = await db.query('characters', where: 'id = ?', whereArgs: [character.id]);
    if(query.isNotEmpty){
      await db.update('characters', character.toDatabaseMap(), where: 'id = ?', whereArgs: [character.id]);
    }else{
      await db.insert('characters', character.toDatabaseMap());
    }
  }

  @override
  Future<List<CharacterDatabaseModel>> getCharacters({int page = 1, int limit = 20}) async {
    final List<CharacterDatabaseModel> characters = [];
    final db = _databaseClient.database;
    final query = await db.query('characters', offset: (page - 1) * limit, limit: limit);
    for(Map<String, dynamic> element in query){
      characters.add(CharacterDatabaseModel.fromDatabaseMap(element));
    }
    return characters;
  }

  @override
  Future<void> removeCharacter(CharacterDatabaseModel character) async {
    final db = _databaseClient.database;
    await db.delete('characters', where: 'id = ?', whereArgs: [character.id]);
  }

  @override
  Future<CharacterDatabaseModel?> getCharacterById(int id) async {
    final db = _databaseClient.database;
    final query = (await db.query('characters', where: 'id = ?', whereArgs: [id])).firstOrNull;
    if(query != null){
      return CharacterDatabaseModel.fromDatabaseMap(query);
    }
    return null;
  }
}