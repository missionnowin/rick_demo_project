import 'package:rick_demo_project/data/services/database/database_service.dart';
import 'package:rick_demo_project/data/services/network/network_service.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';
import 'package:rick_demo_project/presentation/mapper/domain_to_view_mapper.dart';

class CharactersRepositoryImpl implements CharactersRepository{
  final NetworkService _networkService;
  final DatabaseService _databaseService;

  CharactersRepositoryImpl({required NetworkService networkService, required DatabaseService databaseService}) : _networkService = networkService, _databaseService = databaseService;

  @override
  Future<void> addCharacterToFavorites(CharacterModel character) {
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterModel>> getCharacters() async{
    final apiCharacters = await _networkService.getCharacters();
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterModel>> getFavoriteCharacters() {
    // TODO: implement getFavoriteCharacters
    throw UnimplementedError();
  }

  @override
  Future<void> removeCharacterFromFavorites(CharacterModel character) {
    // TODO: implement removeCharacterFromFavorites
    throw UnimplementedError();
  }
}