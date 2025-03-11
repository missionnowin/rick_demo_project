import 'package:flutter/cupertino.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart';
import 'package:rick_demo_project/domain/usecases/get_characters.dart';
import 'package:rick_demo_project/domain/usecases/get_favorite_characters.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/mapper/domain_to_view_mapper.dart';
import 'package:rick_demo_project/presentation/models/character_presentation_model.dart';

class CharacterViewModel{
  final GetCharacters _getCharacters;
  final RemoveCharacterFromFavorite _removeCharacterFromFavorite;
  final AddCharacterToFavorite _addCharacterToFavorite;
  List<CharacterModel> _characters = [];

  CharacterViewModel({required GetCharacters getCharacters, required RemoveCharacterFromFavorite removeCharacterFromFavorite, required AddCharacterToFavorite addCharacterToFavorite}) : _getCharacters = getCharacters, _removeCharacterFromFavorite = removeCharacterFromFavorite, _addCharacterToFavorite = addCharacterToFavorite;

  Future<void> addCharacterToFavorite(CharacterPresentationModel character) async {
    final domainCharacter = _characters.firstWhere((c) => c.id == character.id);
    await _addCharacterToFavorite.call(domainCharacter);
  }

  Future<void> removeCharacterFromFavorite(CharacterPresentationModel character) async {
    final domainCharacter = _characters.firstWhere((c) => c.id == character.id);
    await _removeCharacterFromFavorite.call(domainCharacter);
  }

  Future<List<CharacterPresentationModel>> getCharacters() async {
    _characters = await _getCharacters.call();
    return _characters.map((character) => character.toPresentationModel()).toList();
  }
}