part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharacterCardPresentationModel> characters;
  final bool canLoadMore;
  final bool isLoading;

  CharactersLoaded({required this.characters, required this.canLoadMore, required this.isLoading});
}

class CharactersError extends CharactersState {
  final String message;

  CharactersError({required this.message});
}

class CharactersLoadedError extends CharactersLoaded {
  final String message;

  CharactersLoadedError({required super.characters, required super.canLoadMore, required super.isLoading, required this.message});

}
