part of 'favorite_characters_bloc.dart';

@immutable
sealed class FavoriteCharactersState {}

final class FavoriteCharactersInitial extends FavoriteCharactersState {}

final class FavoriteCharactersLoading extends FavoriteCharactersState {}

class FavoriteCharactersLoaded extends FavoriteCharactersState {
  final List<CharacterCardPresentationModel> favoriteCharacters;
  final bool canLoadMore;
  final bool isLoading;

  FavoriteCharactersLoaded({required this.favoriteCharacters, required this.canLoadMore, required this.isLoading});
}

class FavoriteCharactersError extends FavoriteCharactersState {
  final String message;

  FavoriteCharactersError(this.message);
}

class FavoriteCharactersLoadedError extends FavoriteCharactersLoaded{
  final String message;

  FavoriteCharactersLoadedError({required super.favoriteCharacters, required super.canLoadMore, required super.isLoading, required this.message});
}