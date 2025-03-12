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
  }

  @override
  Future<List<CharacterDatabaseModel>> getCharacters() async{
    // TODO: implement getFavoriteCharacters
    throw UnimplementedError();
  }

  @override
  Future<void> removeCharacter(CharacterDatabaseModel character) async{

  }
}