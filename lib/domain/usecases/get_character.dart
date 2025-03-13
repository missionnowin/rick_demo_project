import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/repositories/characters_repository.dart';

class GetCharacter{
  final CharactersRepository _charactersRepository;

  GetCharacter(CharactersRepository charactersRepository) : _charactersRepository = charactersRepository;

  Future<CharacterModel> call({required int id}) async {
    return await _charactersRepository.getCharacter(id: id);
  }
}