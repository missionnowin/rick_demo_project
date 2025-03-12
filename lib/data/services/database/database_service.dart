import 'package:rick_demo_project/data/models/database/character_database_model.dart';

import 'database_client.dart';

abstract class DatabaseService{
  Future<void> saveCharacter(CharacterDatabaseModel character);
  Future<void> removeCharacter(CharacterDatabaseModel character);
  Future<List<CharacterDatabaseModel>> getCharacters();
}

class DatabaseServiceImpl implements DatabaseService{
  final DatabaseClient _databaseClient;

  DatabaseServiceImpl(this._databaseClient);

  @override
  Future<void> saveCharacter(CharacterDatabaseModel character) async{
    final db = _databaseClient.database;
    final query = await db.query('characters', where: 'id = ?', whereArgs: [character.id]);
    if(query.isNotEmpty){
      await db.update('characters', character.toJson(), where: 'id = ?', whereArgs: [character.id]);
    }else{
      await db.insert('characters', character.toJson());
    }
  }

  @override
  Future<List<CharacterDatabaseModel>> getCharacters() async{
    final List<CharacterDatabaseModel> characters = [];
    final db = _databaseClient.database;
    final query = await db.query('characters');
    for(Map<String, dynamic> element in query){
      characters.add(CharacterDatabaseModel.fromJson(element));
    }
    return characters;
  }

  @override
  Future<void> removeCharacter(CharacterDatabaseModel character) async{
    final db = _databaseClient.database;
    await db.delete('characters', where: 'id = ?', whereArgs: [character.id]);
  }
}