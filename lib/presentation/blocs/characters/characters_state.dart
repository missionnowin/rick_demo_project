part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharacterPresentationModel> favoriteCharacters;
  final bool canLoadMore;

  CharactersLoaded(this.favoriteCharacters, this.canLoadMore);
}

class CharactersError extends CharactersState {
  final String message;

  CharactersError({required this.message});
}

class CharactersLoadedError extends CharactersLoaded {
  final String message;

  CharactersLoadedError(super.favoriteCharacters, super.canLoadMore, this.message);

}

class CharactersLoadingMore extends CharactersLoaded {
  CharactersLoadingMore(super.favoriteCharacters, super.canLoadMore);
}
