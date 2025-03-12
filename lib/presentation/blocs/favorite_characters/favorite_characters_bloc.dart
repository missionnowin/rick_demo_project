import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart';
import 'package:rick_demo_project/domain/usecases/get_favorite_characters.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/event_bus/character_event.dart';
import 'package:rick_demo_project/presentation/event_bus/character_event_bus.dart';
import 'package:rick_demo_project/presentation/mapper/domain_to_view_mapper.dart';
import 'package:rick_demo_project/presentation/models/character_presentation_model.dart';

part 'favorite_characters_event.dart';
part 'favorite_characters_state.dart';

class FavoriteCharactersBloc extends Bloc<FavoriteCharactersEvent, FavoriteCharactersState> {
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
    on<UpdateFavorites>(_onUpdate);

    _eventSubscription = _eventBus.on<FavoritesChanged>().listen((event) {
      add(UpdateFavorites(event.data));
    });
  }

  Future<void> _onFetch(FetchFavoriteCharactersEvent event, Emitter<FavoriteCharactersState> emit) async{
    emit(FavoriteCharactersLoading());
    try{
      _characters = await _getFavoriteCharacters.call();
      emit(FavoriteCharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList()));
    }catch(e){
      emit(FavoriteCharactersEditError(_characters.map((character) => character.toPresentationModel()).toList(), 'Something went wrong: $e'));
    }
  }

  Future<void> _onRemove(RemoveCharacterFromFavoriteEvent event, Emitter<FavoriteCharactersState> emit) async {
    try{
      final domainCharacter = _characters.firstWhere((c) => c.id == event.character.id);
      final updatedCharacter = await _removeCharacterFromFavorite.call(domainCharacter);
      _eventBus.notifyFavoritesChanged(FavoritesChanged(updatedCharacter));
    }catch(e){
      emit(FavoriteCharactersEditError(_characters.map((character) => character.toPresentationModel()).toList(), 'Something went wrong: $e'));
    }
  }

  Future<void> _onUpdate(UpdateFavorites event, Emitter<FavoriteCharactersState> emit) async {
    int index = _characters.indexWhere((character) => character.id == event.character.id);
    if(index != -1) {
      _characters.removeAt(index);
    }else{
      _characters.add(event.character);
    }
    emit(FavoriteCharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList()));
  }

  @override
  Future<void> close() {
    _eventSubscription?.cancel();
    return super.close();
  }
}
