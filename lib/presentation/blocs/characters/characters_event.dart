part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

class FetchCharactersEvent extends CharactersEvent {}

class ToggleFavoriteCharacterEvent extends CharactersEvent{
  final int characterId;

  ToggleFavoriteCharacterEvent(this.characterId);
}

class UpdateCharactersEvent extends CharactersEvent {
  final CharacterModel character;

  UpdateCharactersEvent(this.character);
}

class LoadMoreCharactersEvent extends CharactersEvent {

}