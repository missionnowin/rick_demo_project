import 'package:rick_demo_project/domain/entities/character_domain_model.dart';

abstract class CharactersRepository{
  Future<List<CharacterModel>> getCharacters({int page = 1, int limit = 20});
  Future<void> saveCharacter(CharacterModel character);
  Future<void> removeCharacter(CharacterModel character);
  Future<List<CharacterModel>> getFavoriteCharacters({int page = 1, int limit = 20});
  Future<CharacterModel> getCharacter({required int id});
}