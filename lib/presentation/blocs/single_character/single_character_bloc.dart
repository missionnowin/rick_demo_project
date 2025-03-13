import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart';
import 'package:rick_demo_project/domain/usecases/get_character.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/event_bus/character_event.dart';
import 'package:rick_demo_project/presentation/event_bus/character_event_bus.dart';

part 'single_character_event.dart';
part 'single_character_state.dart';

class SingleCharacterBloc extends Bloc<SingleCharacterEvent, SingleCharacterState> {
  final AddCharacterToFavorite _addCharacterToFavorite;
  final RemoveCharacterFromFavorite _removeCharacterFromFavorite;
  final GetCharacter _getCharacter;
  final CharacterEventBus _eventBus;

  SingleCharacterBloc({
    required AddCharacterToFavorite addCharacterToFavorite,
    required RemoveCharacterFromFavorite removeCharacterFromFavorite,
    required GetCharacter getCharacter,
    required CharacterEventBus eventBus})
      :
        _addCharacterToFavorite = addCharacterToFavorite,
        _removeCharacterFromFavorite = removeCharacterFromFavorite,
        _eventBus = eventBus,
        _getCharacter = getCharacter,
        super(SingleCharacterInitial()) {
    on<FetchSingleCharacterEvent>(_onFetch);
    on<ToggleFavoriteEvent>(_onToggle);
  }

  Future<void> _onFetch(FetchSingleCharacterEvent event, Emitter<SingleCharacterState> emit) async {
    try{
      final character = await _getCharacter.call(id: event.id);
      emit(SingleCharacterLoaded(character));
    }catch(e){
      emit(SingleCharacterError('Something went wrong: $e'));
    }
  }

  Future<void> _onToggle(ToggleFavoriteEvent event, Emitter<SingleCharacterState> emit) async {
    if(state is SingleCharacterLoaded){
      final charState = state as SingleCharacterLoaded;
      final character = charState.character;
      try{
        final updatedCharacter = character.favorite != true ? await _addCharacterToFavorite.call(character) :  await _removeCharacterFromFavorite.call(character);
        emit(SingleCharacterLoaded(updatedCharacter));
        _eventBus.notifyFavoritesChanged(FavoritesChanged(updatedCharacter));
      }catch(e){
        emit(SingleCharacterTogglingError(character, 'Something went wrong: $e'));
      }
    }
  }
}

