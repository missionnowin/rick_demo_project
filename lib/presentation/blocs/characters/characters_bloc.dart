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
import 'package:rick_demo_project/presentation/models/character_presentation_model.dart';

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
    on<AddCharacterToFavoriteEvent>(_onAdd);
    on<RemoveCharacterFromFavoriteEvent>(_onRemove);
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
      emit(CharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList(), true));
    }catch(e){
      emit(CharactersError(message: 'Something went wrong: $e'));
    }
  }

  Future<void> _onAdd(AddCharacterToFavoriteEvent event, Emitter<CharactersState> emit) async {
    if(state is CharactersLoaded){
      final charState = state as CharactersLoaded;
      try{
        final index = _characters.indexWhere((c) => c.id == event.character.id);
        if(index == -1){
          throw Exception('Character not found');
        }
        final domainCharacter = _characters[index];
        final updatedCharacter = await _addCharacterToFavorite.call(domainCharacter);
        _eventBus.notifyFavoritesChanged(FavoritesChanged(updatedCharacter));
      }catch(e){
        emit(CharactersLoadedError(charState.favoriteCharacters, charState.canLoadMore, 'Something went wrong: $e'));
      }
    }
  }

  Future<void> _onRemove(RemoveCharacterFromFavoriteEvent event, Emitter<CharactersState> emit) async {
    if(state is CharactersLoaded){
      final charState = state as CharactersLoaded;
      try{
        final index = _characters.indexWhere((c) => c.id == event.character.id);
        if(index == -1){
          throw Exception('Character not found');
        }
        final domainCharacter = _characters[index];
        final updatedCharacter = await _removeCharacterFromFavorite.call(domainCharacter);
        _eventBus.notifyFavoritesChanged(FavoritesChanged(updatedCharacter));
      }catch(e){
        emit(CharactersLoadedError(charState.favoriteCharacters, charState.canLoadMore, 'Something went wrong: $e'));
      }
    }
  }

  Future<void> _onUpdate(UpdateCharactersEvent event, Emitter<CharactersState> emit) async {
    if(state is CharactersLoaded){
      final index = _characters.indexWhere((c) => c.id == event.character.id);
      if(index != -1){
        _characters[index] = event.character;
      }
      emit(CharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList(), (state as CharactersLoaded).canLoadMore));
    }
  }

  Future<void> _onLoadMore(LoadMoreCharactersEvent event, Emitter<CharactersState> emit) async {
    if (state is CharactersLoaded && state is! CharactersLoadingMore) {
      final charState = state as CharactersLoaded;
      if(charState.canLoadMore){
        try {
          emit(CharactersLoadingMore(
              charState.favoriteCharacters, charState.canLoadMore));
          final newCharacters = await _getCharacters.call(
              page: ++page, limit: limit);
          if (newCharacters.isNotEmpty) {
            _characters.addAll(newCharacters);
            emit(CharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList(), true));
          } else {
            emit(CharactersLoaded(charState.favoriteCharacters, false));
          }
        } catch (e) {
          emit(CharactersLoadedError(charState.favoriteCharacters, charState.canLoadMore, 'Something went wrong: $e'));
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
