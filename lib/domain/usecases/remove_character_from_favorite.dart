import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';

class RemoveCharacterFromFavorite{
  final CharactersRepository _repository;

  RemoveCharacterFromFavorite(this._repository);

  Future<CharacterModel> call(CharacterModel character) async {
    final updatedCharacter = character.copyWith(favorite: true);
    await _repository.saveCharacter(updatedCharacter);
    return updatedCharacter;
  }
}