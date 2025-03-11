part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

class FetchCharactersEvent extends CharactersEvent {}

class AddCharacterToFavoriteEvent extends CharactersEvent {
  final CharacterPresentationModel character;

  AddCharacterToFavoriteEvent(this.character);
}

class RemoveCharacterFromFavoriteEvent extends CharactersEvent {
  final CharacterPresentationModel character;

  RemoveCharacterFromFavoriteEvent(this.character);
}