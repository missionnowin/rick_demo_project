import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';

class AddCharacterToFavorite{
  final CharactersRepository _repository;

  AddCharacterToFavorite(this._repository);

  Future<void> call(CharacterModel character) async {
    await _repository.addCharacterToFavorites(character);
  }
}