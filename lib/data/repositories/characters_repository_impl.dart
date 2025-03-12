import 'package:rick_demo_project/data/mappers/api_to_domain_mapper.dart';
import 'package:rick_demo_project/data/mappers/domain_to_database_mapper.dart';
import 'package:rick_demo_project/data/models/api/character_api_model.dart';
import 'package:rick_demo_project/data/services/characters/database/character_database_service.dart';
import 'package:rick_demo_project/data/services/characters/network/character_network_service.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository{
  final NetworkService _networkService;
  final DatabaseService _databaseService;

  CharactersRepositoryImpl({required NetworkService networkService, required DatabaseService databaseService}) : _networkService = networkService, _databaseService = databaseService;

  @override
  Future<List<CharacterModel>> getCharacters({int page = 1, int limit = 20}) async {
    final networkCharacters = await _networkService.getCharacters(page: page, limit: limit);
    final List<CharacterModel> domainCharacters = [];
    for(CharacterApiModel characterApi in networkCharacters){
      final dbCharacter = await _databaseService.getCharacterById(characterApi.id);
      final character = characterApi.toCharacterModel(favorite: dbCharacter == null ? true : false);
      domainCharacters.add(character);
    }
    return domainCharacters;
  }

  @override
  Future<List<CharacterModel>> getFavoriteCharacters({int page = 1, int limit = 20}) async {
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