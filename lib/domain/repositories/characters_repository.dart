import 'package:rick_demo_project/domain/entities/character_domain_model.dart';

abstract class CharactersRepository{
  Future<List<CharacterModel>> getCharacters();
  Future<void> saveCharacter(CharacterModel character);
  Future<void> removeCharacter(CharacterModel character);
  Future<List<CharacterModel>> getFavoriteCharacters();
}