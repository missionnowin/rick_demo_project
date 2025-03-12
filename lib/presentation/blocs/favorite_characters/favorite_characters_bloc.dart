import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart';
import 'package:rick_demo_project/domain/usecases/get_favorite_characters.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/blocs/characters/characters_bloc.dart';
import 'package:rick_demo_project/presentation/event_bus/character_event.dart';
import 'package:rick_demo_project/presentation/event_bus/character_event_bus.dart';
import 'package:rick_demo_project/presentation/mapper/character_mapper.dart';
import 'package:rick_demo_project/presentation/models/character_presentation_model.dart';

part 'favorite_characters_event.dart';
part 'favorite_characters_state.dart';

class FavoriteCharactersBloc extends Bloc<FavoriteCharactersEvent, FavoriteCharactersState> {
  int page = 1;
  final int limit = 20;

  late final StreamSubscription otherBlocSubscription;
  final GetFavoriteCharacters _getFavoriteCharacters;
  final RemoveCharacterFromFavorite _removeCharacterFromFavorite;
  final CharacterEventBus _eventBus;
  late final StreamSubscription? _eventSubscription;

  List<CharacterModel> _characters = [];

  FavoriteCharactersBloc({
    required GetFavoriteCharacters getFavoriteCharacters,
    required AddCharacterToFavorite addCharacterToFavorite,
    required RemoveCharacterFromFavorite removeCharacterFromFavorite,
    required CharacterEventBus eventBus}) :
        _getFavoriteCharacters = getFavoriteCharacters,
        _removeCharacterFromFavorite = removeCharacterFromFavorite,
        _eventBus = eventBus,
    super(FavoriteCharactersInitial()) {
    on<FetchFavoriteCharactersEvent>(_onFetch);
    on<RemoveCharacterFromFavoriteEvent>(_onRemove);
    on<UpdateFavoritesEvent>(_onUpdate);
    on<LoadMoreFavoriteCharactersEvent>(_onLoadMore);

    _eventSubscription = _eventBus.on<FavoritesChanged>().listen((event) {
      add(UpdateFavoritesEvent(event.data));
    });
  }

  Future<void> _onFetch(FetchFavoriteCharactersEvent event, Emitter<FavoriteCharactersState> emit) async{
    emit(FavoriteCharactersLoading());
    try{
      page = 1;
      _characters = await _getFavoriteCharacters.call();
      emit(FavoriteCharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList(), true));
    }catch(e){
      emit(FavoriteCharactersError('Something went wrong: $e'));
    }
  }

  Future<void> _onRemove(RemoveCharacterFromFavoriteEvent event, Emitter<FavoriteCharactersState> emit) async {
    if(state is FavoriteCharactersLoaded){
      final charState = state as FavoriteCharactersLoaded;
      try{
        final domainCharacter = _characters.firstWhere((c) => c.id == event.character.id);
        final updatedCharacter = await _removeCharacterFromFavorite.call(domainCharacter);
        _eventBus.notifyFavoritesChanged(FavoritesChanged(updatedCharacter));
      }catch(e){
        emit(FavoriteCharactersLoadedError(charState.favoriteCharacters, charState.canLoadMore,'Something went wrong: $e'));
      }
    }
  }

  Future<void> _onUpdate(UpdateFavoritesEvent event, Emitter<FavoriteCharactersState> emit) async {
    int index = _characters.indexWhere((character) => character.id == event.character.id);
    if(index != -1) {
      _characters.removeAt(index);
    }else{
      _characters.add(event.character);
    }
    emit(FavoriteCharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList(), true));
  }

  Future<void> _onLoadMore(LoadMoreFavoriteCharactersEvent event, Emitter<FavoriteCharactersState> emit) async {
    if(state is FavoriteCharactersLoaded && state is! FavoriteCharactersLoadingMore) {
      final charState = state as FavoriteCharactersLoaded;
      if(charState.canLoadMore){
        try {
          emit(FavoriteCharactersLoadingMore(charState.favoriteCharacters, true));
          final newCharacters = await _getFavoriteCharacters.call(
              page: ++page, limit: limit);
          if (newCharacters.isNotEmpty) {
            _characters.addAll(newCharacters);
            emit(FavoriteCharactersLoaded(
                _characters
                    .map((character) => character.toPresentationModel())
                    .toList(), true));
          } else {
            emit(FavoriteCharactersLoaded(charState.favoriteCharacters, false));
          }
        } catch (e) {
          emit(FavoriteCharactersLoadedError(charState.favoriteCharacters, charState.canLoadMore, 'Something went wrong: $e'));
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
