import 'package:rick_demo_project/data/models/database/character_database_model.dart';

import 'database_client.dart';

abstract class DatabaseService{
  Future<void> addCharacterToFavorites(CharacterDatabaseModel character);
  Future<void> removeCharacterFromFavorites(CharacterDatabaseModel character);
  Future<List<CharacterDatabaseModel>> getFavoriteCharacters();
}

class DatabaseServiceImpl implements DatabaseService{
  final DatabaseClient _databaseClient;

  DatabaseServiceImpl(this._databaseClient);

  @override
  Future<void> addCharacterToFavorites(CharacterDatabaseModel character) async{
    final db = _databaseClient.database;
  }

  @override
  Future<List<CharacterDatabaseModel>> getFavoriteCharacters() async{
    // TODO: implement getFavoriteCharacters
    throw UnimplementedError();
  }

  @override
  Future<void> removeCharacterFromFavorites(CharacterDatabaseModel character) async{

  }
}