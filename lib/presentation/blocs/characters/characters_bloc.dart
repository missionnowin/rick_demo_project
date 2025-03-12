import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart';
import 'package:rick_demo_project/domain/usecases/get_characters.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/event_bus/character_event.dart';
import 'package:rick_demo_project/presentation/event_bus/character_event_bus.dart';
import 'package:rick_demo_project/presentation/mapper/domain_to_view_mapper.dart';
import 'package:rick_demo_project/presentation/models/character_presentation_model.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
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
    on<UpdateCharacters>(_onUpdate);

    _eventSubscription = _eventBus.on<FavoritesChanged>().listen((event) {
      add(UpdateCharacters(event.data));
    });
  }

  Future<void> _onFetch(FetchCharactersEvent event, Emitter<CharactersState> emit) async {
    emit(CharactersLoading());
    try{
      _characters = await _getCharacters.call();
      emit(CharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList()));
    }catch(e){
      emit(CharactersError(message: 'Something went wrong: $e'));
    }
  }

  Future<void> _onAdd(AddCharacterToFavoriteEvent event, Emitter<CharactersState> emit) async {
    try{
      final index = _characters.indexWhere((c) => c.id == event.character.id);
      if(index == -1){
        throw Exception('Character not found');
      }
      final domainCharacter = _characters[index];
      final updatedCharacter = await _addCharacterToFavorite.call(domainCharacter);
      _eventBus.notifyFavoritesChanged(FavoritesChanged(updatedCharacter));
    }catch(e){
      emit(CharactersAddFavoriteError(_characters.map((character) => character.toPresentationModel()).toList(), e.toString()));
    }
  }

  Future<void> _onRemove(RemoveCharacterFromFavoriteEvent event, Emitter<CharactersState> emit) async {
    try{
      final index = _characters.indexWhere((c) => c.id == event.character.id);
      if(index == -1){
        throw Exception('Character not found');
      }
      final domainCharacter = _characters[index];
      final updatedCharacter = await _removeCharacterFromFavorite.call(domainCharacter);
      _eventBus.notifyFavoritesChanged(FavoritesChanged(updatedCharacter));
    }catch(e){
      emit(CharactersAddFavoriteError(_characters.map((character) => character.toPresentationModel()).toList(), e.toString()));
    }
  }

  @override
  Future<void> close() {
    _eventSubscription?.cancel();
    return super.close();
  }

  Future<void> _onUpdate(UpdateCharacters event, Emitter<CharactersState> emit) async {
    final index = _characters.indexWhere((c) => c.id == event.character.id);
    if(index != -1){
      _characters[index] = event.character;
    }
  }
}
