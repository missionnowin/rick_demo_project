import 'package:rick_demo_project/data/mappers/api_to_domain_mapper.dart';
import 'package:rick_demo_project/data/mappers/domain_to_database_mapper.dart';
import 'package:rick_demo_project/data/services/database/database_service.dart';
import 'package:rick_demo_project/data/services/network/network_service.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository{
  final NetworkService _networkService;
  final DatabaseService _databaseService;

  CharactersRepositoryImpl({required NetworkService networkService, required DatabaseService databaseService}) : _networkService = networkService, _databaseService = databaseService;

  @override
  Future<List<CharacterModel>> getCharacters() async {
    final characters = await _networkService.getCharacters();
    return characters.map((character) => character.toCharacterModel()).toList();
  }

  @override
  Future<List<CharacterModel>> getFavoriteCharacters() async {
    final favoriteDbCharacters = await _databaseService.getCharacters();
    return favoriteDbCharacters.map((character) => character.toModel()).toList();
  }

  @override
  Future<void> removeCharacter(CharacterModel character) async {
    await _databaseService.removeCharacter(character.toDatabaseModel());
  }

  @override
  Future<void> saveCharacter(CharacterModel character) async {
    await _databaseService.saveCharacter(character.toDatabaseModel());
  }
}