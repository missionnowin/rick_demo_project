part of 'favorite_characters_bloc.dart';

@immutable
sealed class FavoriteCharactersState {}

final class FavoriteCharactersInitial extends FavoriteCharactersState {}

final class FavoriteCharactersLoading extends FavoriteCharactersState {}

class FavoriteCharactersLoaded extends FavoriteCharactersState {
  final List<CharacterPresentationModel> favoriteCharacters;

  FavoriteCharactersLoaded(this.favoriteCharacters);
}

class FavoriteCharactersError extends FavoriteCharactersState {
  final String message;

  FavoriteCharactersError({required this.message});
}
