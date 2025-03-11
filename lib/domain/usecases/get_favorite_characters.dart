import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';

class GetFavoriteCharacters{
  final CharactersRepository _repository;

  GetFavoriteCharacters(this._repository);

  Future<List<CharacterModel>> call() async {
    return await _repository.getFavoriteCharacters();
  }
}