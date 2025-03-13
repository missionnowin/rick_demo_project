import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart';
import 'package:rick_demo_project/domain/usecases/get_characters.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/event_bus/character_event.dart';
import 'package:rick_demo_project/presentation/event_bus/character_event_bus.dart';
import 'package:rick_demo_project/presentation/mapper/character_mapper.dart';
import 'package:rick_demo_project/presentation/models/character_card_presentation_model.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  int page = 1;
  final int limit = 20;

  final GetCharacters _getCharacters;
  final AddCharacterToFavorite _addCharacterToFavorite;
  final RemoveCharacterFromFavorite _removeCharacterFromFavorite;
  final CharacterEventBus _eventBus;
  StreamSubscription? _eventSubscription;

  List<CharacterModel> _characters = [];

  CharactersBloc({
    required GetCharacters getCharacters,
    required AddCharacterToFavorite addCharacterToFavorite,
    required RemoveCharacterFromFavorite removeCharacterFromFavorite,
    required CharacterEventBus eventBus}) :
        _getCharacters = getCharacters,
        _addCharacterToFavorite = addCharacterToFavorite,
        _removeCharacterFromFavorite = removeCharacterFromFavorite,
        _eventBus = eventBus,
        super(CharactersInitial()) {
    on<FetchCharactersEvent>(_onFetch);
    on<ToggleFavoriteCharacterEvent>(_onToggle);
    on<UpdateCharactersEvent>(_onUpdate);
    on<LoadMoreCharactersEvent>(_onLoadMore);

    _eventSubscription = _eventBus.on<FavoritesChanged>().listen((event) {
      add(UpdateCharactersEvent(event.data));
    });
  }

  Future<void> _onFetch(FetchCharactersEvent event, Emitter<CharactersState> emit) async {
    emit(CharactersLoading());
    try{
      page = 1;
      _characters = await _getCharacters.call();
      emit(CharactersLoaded(
          characters: _characters.map((character) => character.toPresentationModel()).toList(),
          canLoadMore: true,
          isLoading: false
      ));
    }catch(e){
      emit(CharactersError(message: 'Something went wrong: $e'));
    }
  }

  Future<void> _onToggle(ToggleFavoriteCharacterEvent event, Emitter<CharactersState> emit) async {
    if(state is CharactersLoaded){
      final charState = state as CharactersLoaded;
      try{
        final index = _characters.indexWhere((c) => c.id == event.characterId);
        if(index == -1){
          throw Exception('Character not found');
        }
        final domainCharacter = _characters[index];
        final updatedCharacter = domainCharacter.favorite == true ? await _removeCharacterFromFavorite(domainCharacter) : await _addCharacterToFavorite.call(domainCharacter);
        _eventBus.notifyFavoritesChanged(FavoritesChanged(updatedCharacter));
      }catch(e){
        emit(CharactersLoadedError(
            characters: charState.characters,
            canLoadMore: charState.canLoadMore,
            message: 'Something went wrong: $e',
            isLoading: charState.isLoading
        ));
      }
    }
  }

  Future<void> _onUpdate(UpdateCharactersEvent event, Emitter<CharactersState> emit) async {
    if(state is CharactersLoaded){
      final charState = state as CharactersLoaded;
      final index = _characters.indexWhere((c) => c.id == event.character.id);
      if(index != -1){
        _characters[index] = event.character;
      }
      emit(CharactersLoaded(
          characters: _characters.map((character) => character.toPresentationModel()).toList(),
          canLoadMore: charState.canLoadMore,
          isLoading: charState.isLoading
      ));
    }
  }

  Future<void> _onLoadMore(LoadMoreCharactersEvent event, Emitter<CharactersState> emit) async {
    if (state is CharactersLoaded) {
      final charState = state as CharactersLoaded;
      if(charState.canLoadMore && charState.isLoading != true){
        try {
          emit(CharactersLoaded(
              characters: charState.characters,
              canLoadMore: charState.canLoadMore,
              isLoading: true
          ));
          final newCharacters = await _getCharacters.call(page: ++page, limit: limit);
          if (newCharacters.isNotEmpty) {
            _characters.addAll(newCharacters);
            emit(CharactersLoaded(
                characters: _characters.map((character) => character.toPresentationModel()).toList(),
                canLoadMore: true,
                isLoading: false
            ));
          } else {
            emit(CharactersLoaded(
                characters: charState.characters,
                canLoadMore: false,
                isLoading: true
            ));
          }
        } catch (e) {
          emit(CharactersLoadedError(
              characters: charState.characters,
              canLoadMore: charState.canLoadMore,
              isLoading: false,
              message: 'Something went wrong: $e'
          ));
        }
      }
    }
  }

  @override
  Future<void> close() {
    _eventSubscription?.cancel();
    return super.close();
  }
}
