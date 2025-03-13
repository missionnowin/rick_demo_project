import 'package:rick_demo_project/data/mappers/api_to_domain_mapper.dart';
import 'package:rick_demo_project/data/mappers/domain_to_database_mapper.dart';
import 'package:rick_demo_project/data/models/api/character_api_model.dart';
import 'package:rick_demo_project/data/services/characters/database/character_database_service.dart';
import 'package:rick_demo_project/data/services/characters/network/character_network_service.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository{
  final CharacterNetworkService _networkService;
  final CharacterDatabaseService _databaseService;

  CharactersRepositoryImpl({required CharacterNetworkService networkService, required CharacterDatabaseService databaseService}) : _networkService = networkService, _databaseService = databaseService;

  @override
  Future<List<CharacterModel>> getCharacters({int page = 1, int limit = 20}) async {
    final networkCharacters = await _networkService.getCharacters(page: page, limit: limit);
    final List<CharacterModel> domainCharacters = [];
    for(CharacterApiModel characterApi in networkCharacters){
      final dbCharacter = await _databaseService.getCharacterById(characterApi.id);
      final character = characterApi.toCharacterModel(favorite: dbCharacter == null ? false : true);
      domainCharacters.add(character);
    }
    return domainCharacters;
  }

  @override
  Future<List<CharacterModel>> getFavoriteCharacters({int page = 1, int limit = 20}) async {
    final favoriteDbCharacters = await _databaseService.getCharacters(page: page, limit: limit);
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

  @override
  Future<CharacterModel> getCharacter({required int id}) async {
    final character = await _networkService.getCharacter(id: id);
    final dbCharacter = await _databaseService.getCharacterById(id);
    return character.toCharacterModel(favorite: dbCharacter == null ? false : true);
  }
}