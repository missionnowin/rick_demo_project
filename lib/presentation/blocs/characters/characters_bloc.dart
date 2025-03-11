import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/domain/usecases/add_character_to_favorite.dart';
import 'package:rick_demo_project/domain/usecases/get_characters.dart';
import 'package:rick_demo_project/domain/usecases/remove_character_from_favorite.dart';
import 'package:rick_demo_project/presentation/mapper/domain_to_view_mapper.dart';
import 'package:rick_demo_project/presentation/models/character_presentation_model.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharacters _getCharacters;
  final AddCharacterToFavorite _addCharacterToFavorite;
  final RemoveCharacterFromFavorite _removeCharacterFromFavorite;

  List<CharacterModel> _characters = [];

  CharactersBloc({
    required GetCharacters getCharacters,
    required AddCharacterToFavorite addCharacterToFavorite,
    required RemoveCharacterFromFavorite removeCharacterFromFavorite}) :
        _getCharacters = getCharacters,
        _addCharacterToFavorite = addCharacterToFavorite,
        _removeCharacterFromFavorite = removeCharacterFromFavorite,
        super(CharactersInitial()) {
    on<FetchCharactersEvent>(_onFetch);
    on<AddCharacterToFavoriteEvent>(_onAdd);
    on<RemoveCharacterFromFavoriteEvent>(_onRemove);
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
      final domainCharacter = _characters.firstWhere((c) => c.id == character.id);
      await _addCharacterToFavorite.call(domainCharacter);
      domainCharacter.favorite = true;
      emit(CharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList()));
    }catch(e){
      print(e);
    }
  }

  Future<void> _onRemove(RemoveCharacterFromFavoriteEvent event, Emitter<CharactersState> emit) async {
    try{
      final domainCharacter = _characters.firstWhere((c) => c.id == character.id);
      await _removeCharacterFromFavorite.call(domainCharacter);
      domainCharacter.favorite = false;
      emit(CharactersLoaded(_characters.map((character) => character.toPresentationModel()).toList()));
    }catch(e){
      print(e);
    }
  }
}
