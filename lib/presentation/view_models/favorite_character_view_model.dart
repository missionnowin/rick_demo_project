import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart' show AddCharacterToFavorite;
import 'package:rick_demo_project/domain/usecases/get_favorite_characters.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/mapper/domain_to_view_mapper.dart';
import 'package:rick_demo_project/presentation/models/character_presentation_model.dart';

class FavoriteCharacterViewModel{
  final RemoveCharacterFromFavorite _removeCharacterFromFavorite;
  final GetFavoriteCharacters _getFavoriteCharacters;
  final AddCharacterToFavorite _addCharacterToFavorite;
  List<CharacterModel> _characters = [];

  FavoriteCharacterViewModel({required RemoveCharacterFromFavorite removeCharacterFromFavorite, required GetFavoriteCharacters getFavoriteCharacters, required AddCharacterToFavorite addCharacterToFavorite}) : _removeCharacterFromFavorite = removeCharacterFromFavorite, _getFavoriteCharacters = getFavoriteCharacters, _addCharacterToFavorite = addCharacterToFavorite;

  Future<void> addCharacterToFavorite(CharacterPresentationModel character) async {
    final domainCharacter = _characters.firstWhere((c) => c.id == character.id);
    await _addCharacterToFavorite.call(domainCharacter);
  }

  Future<void> removeCharacterFromFavorite(CharacterPresentationModel character) async {
    final domainCharacter = _characters.firstWhere((c) => c.id == character.id);
    await _removeCharacterFromFavorite.call(domainCharacter);
  }

  Future<List<CharacterPresentationModel>> getFavoriteCharacters() async {
    _characters = await _getFavoriteCharacters.call();
    return _characters.map((character) => character.toPresentationModel()).toList();
  }
}