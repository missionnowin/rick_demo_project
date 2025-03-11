import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart';
import 'package:rick_demo_project/domain/usecases/get_favorite_characters.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/mapper/domain_to_view_mapper.dart';
import 'package:rick_demo_project/presentation/models/character_presentation_model.dart';

part 'favorite_characters_event.dart';
part 'favorite_characters_state.dart';

class FavoriteCharactersBloc extends Bloc<FavoriteCharactersEvent, FavoriteCharactersState> {
  final GetFavoriteCharacters _getFavoriteCharacters;
  final AddCharacterToFavorite _addCharacterToFavorite;
  final RemoveCharacterFromFavorite _removeCharacterFromFavorite;

  List<CharacterModel> _characters = [];

  FavoriteCharactersBloc({
    required GetFavoriteCharacters getFavoriteCharacters,
    required AddCharacterToFavorite addCharacterToFavorite,
    required RemoveCharacterFromFavorite removeCharacterFromFavorite}) :
        _getFavoriteCharacters = getFavoriteCharacters,
        _addCharacterToFavorite = addCharacterToFavorite,
        _removeCharacterFromFavorite = removeCharacterFromFavorite,
    super(FavoriteCharactersInitial()) {
    on<FetchFavoriteCharactersEvent>(_onFetch);
    on<AddCharacterToFavoriteEvent>(_onAdd);
    on<RemoveCharacterFromFavoriteEvent>(_onRemove);
  }

  Future<void> _onFetch(FetchFavoriteCharactersEvent event, Emitter<FavoriteCharactersState> emit) async{
    emit(FavoriteCharactersLoading());
    try{
      _characters = await _getFavoriteCharacters.call();
      emit(FavoriteCharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList()));
    }catch(e){
      emit(FavoriteCharactersError(message: 'Something went wrong: $e'));
    }
  }

  Future<void> _onAdd(AddCharacterToFavoriteEvent event, Emitter<FavoriteCharactersState> emit) async {
    try{
      final domainCharacter = _characters.firstWhere((c) => c.id == character.id);
      await _addCharacterToFavorite.call(domainCharacter);
      domainCharacter.favorite = true;
      emit(FavoriteCharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList()));
    }catch(e){
      print(e);
    }
  }

  Future<void> _onRemove(RemoveCharacterFromFavoriteEvent event, Emitter<FavoriteCharactersState> emit) async {
    try{
      final domainCharacter = _characters.firstWhere((c) => c.id == character.id);
      await _removeCharacterFromFavorite.call(domainCharacter);
      domainCharacter.favorite = false;
      emit(FavoriteCharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList()));
    }catch(e){
      print(e);
    }
  }
}
