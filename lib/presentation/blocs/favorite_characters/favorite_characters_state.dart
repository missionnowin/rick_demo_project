part of 'favorite_characters_bloc.dart';

@immutable
sealed class FavoriteCharactersState {}

final class FavoriteCharactersInitial extends FavoriteCharactersState {}

final class FavoriteCharactersLoading extends FavoriteCharactersState {}

class FavoriteCharactersLoaded extends FavoriteCharactersState {
  final List<CharacterPresentationModel> favoriteCharacters;
  final bool canLoadMore;

  FavoriteCharactersLoaded(this.favoriteCharacters, this.canLoadMore);
}

class FavoriteCharactersError extends FavoriteCharactersState {
  final String message;

  FavoriteCharactersError(this.message);
}

class FavoriteCharactersLoadedError extends FavoriteCharactersLoaded{
  final String message;

  FavoriteCharactersLoadedError(super.favoriteCharacters, super.canLoadMore, this.message);
}

class FavoriteCharactersLoadingMore extends FavoriteCharactersLoaded{

  FavoriteCharactersLoadingMore(super.favoriteCharacters, super.canLoadMore);
}