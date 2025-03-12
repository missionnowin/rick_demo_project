part of 'favorite_characters_bloc.dart';

@immutable
sealed class FavoriteCharactersEvent {}

class FetchFavoriteCharactersEvent extends FavoriteCharactersEvent {}

class AddCharacterToFavoriteEvent extends FavoriteCharactersEvent {
  final CharacterPresentationModel character;

  AddCharacterToFavoriteEvent(this.character);
}

class RemoveCharacterFromFavoriteEvent extends FavoriteCharactersEvent {
  final CharacterPresentationModel character;

  RemoveCharacterFromFavoriteEvent(this.character);
}

class UpdateFavoritesEvent extends FavoriteCharactersEvent {
  final CharacterModel character;

  UpdateFavoritesEvent(this.character);
}

class LoadMoreFavoriteCharactersEvent extends FavoriteCharactersEvent {

}