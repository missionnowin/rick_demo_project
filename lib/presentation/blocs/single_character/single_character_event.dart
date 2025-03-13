part of 'single_character_bloc.dart';

@immutable
sealed class SingleCharacterEvent {}
class FetchSingleCharacterEvent extends SingleCharacterEvent{
  final int id;

  FetchSingleCharacterEvent(this.id);
}
class ToggleFavoriteEvent extends SingleCharacterEvent{
  final CharacterModel character;

  ToggleFavoriteEvent(this.character);
}
