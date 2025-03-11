import 'package:rick_demo_project/domain/entities/character_domain_model.dart';

abstract class CharactersRepository{
  Future<List<CharacterModel>> getCharacters();
  Future<void> addCharacterToFavorites(CharacterModel character);
  Future<void> removeCharacterFromFavorites(CharacterModel character);
  Future<List<CharacterModel>> getFavoriteCharacters();
}