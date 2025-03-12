import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';

class GetCharacters{
  final CharactersRepository _repository;

  GetCharacters(this._repository);

  Future<List<CharacterModel>> call({int page = 1, int limit = 20}) async {
    return await _repository.getCharacters(page: page, limit: limit);
  }
}